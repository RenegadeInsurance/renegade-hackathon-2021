<?php
namespace Modules\Core\Repositories;

use Exception;
use Illuminate\Support\Facades\DB;
use Modules\Core\Traits\Cacheable;
use Illuminate\Database\Eloquent\Model;
use Modules\Core\Traits\Filterable;

class BaseRepository
{
    use Cacheable;
    use Filterable;

    public object $model;
    public array $rules;
    public array $messages = [];
    public int $per_page = 25;
    public ?string $model_name;
    public ?string $model_key;

    public function model(): Model
    {
        return $this->model;
    }

    public function validateData(
        object $request,
        array $rules = [],
        array $messages = [],
        ?callable $callback = null
    ): array {
        try {
            $data = $request->validate(
                array_merge($this->rules, $rules),
                array_merge($this->messages, $messages)
            );
            $append_data = $callback ? $callback($request) : [];
        } catch (Exception $exception) {
            throw $exception;
        }

        return array_merge($data, $append_data);
    }

    public function fetchAll(object $request, array $with = [], ?callable $callback = null): object
    {
        try {
            $this->validateFiltering($request);
            $rows = $callback ? $callback() : null;
            $hash = md5(json_encode($request->all()));

            $fetched = $this->storeCache("{$this->model_key}.all", $hash, function () use ($request, $with, $rows) {
                $rows = $rows ?? $this->model::query();
                return $this->getFiltered($rows, $request, $with);
            });
        } catch (Exception $exception) {
            throw $exception;
        }

        return $fetched;
    }

    public function fetch(int $id, array $with = [], ?callable $callback = null): object
    {
        try {
            $rows = $callback ? $callback() : $this->model;
            $hash = md5($id);

            if ($with != []) {
                $rows = $rows->with($with);
                $hash = md5(json_encode($with));
            }

            $fetched = $this->storeCache("{$this->model_key}.{$id}", $hash, function () use ($rows, $id) {
                return $rows->findOrFail($id);
            });
        } catch (Exception $exception) {
            throw $exception;
        }

        return $fetched;
    }

    public function store(array $data, ?callable $callback = null): object
    {
        DB::beginTransaction();

        try {
            $created = $this->model->create($data);
            if ($callback) {
                $callback($created);
            }
        } catch (Exception $exception) {
            DB::rollBack();
            throw $exception;
        }

        DB::commit();
        $this->flushAllCache();

        return $created;
    }

    public function update(array $data, int $id, ?callable $callback = null): object
    {
        DB::beginTransaction();

        try {
            $updated = $this->model->findOrFail($id);
            $updated->fill($data);
            $updated->save();

            if ($callback) {
                $callback($updated);
            }
        } catch (Exception $exception) {
            DB::rollBack();
            throw $exception;
        }

        DB::commit();
        $this->flushAllCache($id);
        $this->flushAllCache();

        return $updated;
    }

    public function delete(int $id, ?callable $callback = null): object
    {
        DB::beginTransaction();

        try {
            $deleted = $this->model->findOrFail($id);

            if ($callback) {
                $callback($deleted);
            }

            $deleted->delete();
        } catch (Exception $exception) {
            DB::rollBack();
            throw $exception;
        }

        DB::commit();
        $this->flushAllCache($id);
        $this->flushAllCache();

        return $deleted;
    }
}

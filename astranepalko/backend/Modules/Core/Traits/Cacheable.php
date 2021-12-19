<?php
namespace Modules\Core\Traits;

use Exception;
use Illuminate\Support\Facades\Cache;

trait Cacheable
{
    public function storeCache(string $key, string $hash, callable $callback): object
    {
        try {
            $cached = Cache::tags([$key, $hash])->rememberForever("{$key}.{$hash}", function () use ($callback) {
                return $callback();
            });
        } catch (Exception $exception) {
            throw $exception;
        }

        return $cached;
    }

    public function flushAllCache(string $key = "all"): void
    {
        try {
            Cache::tags(["{$this->model_key}.{$key}"])->flush();
        } catch (Exception $exception) {
            throw $exception;
        }
    }
}

<?php

namespace Modules\Core\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Modules\Core\Traits\ApiResponse;
use Modules\Core\Traits\Transformable;
use Modules\Core\Traits\ResponseMessage;
use Modules\Core\Traits\ExceptionHandler;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Modules\Core\Transformers\BaseResource;

class BaseController extends Controller
{
    use ApiResponse;
    use ExceptionHandler;
    use ResponseMessage;
    use Transformable;

    public array $response_messages;
    public array $exception_messages;
    public array $exception_status_codes;
    public object $transformer;
    public object $model;
    public string $model_name;
    public object $repository;
    public array $relationships = [];

    public function __construct()
    {
        $this->model_name = $this->model_name ?? str_replace('Controller', '', class_basename($this));
        $this->response_messages = [];
        $this->exception_status_codes = [];
        $this->exception_messages = [
            ModelNotFoundException::class => $this->lang("not-found"),
        ];
        $this->transformer = $this->transformer ?? new BaseResource([]);
    }

    public function handleException(object $exception): JsonResponse
    {
        return $this->errorResponse(
            message: $this->getExceptionMessage($exception),
            response_code: $this->getExceptionStatus($exception)
        );
    }

    public function index(Request $request): JsonResponse
    {
        try {
            $fetched = $this->repository->fetchAll($request, $this->relationships);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse(
            message: $this->lang("fetch-all-success"),
            payload: $this->collection($fetched)
        );
    }

    public function store(Request $request): JsonResponse
    {
        try {
            $data = $this->repository->validateData($request);
            $created = $this->repository->store($data);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse(
            message: $this->lang("store-success"),
            payload: $this->resource($created),
            response_code: 201
        );
    }

    public function show(string $id): JsonResponse
    {
        try {
            $fetched = $this->repository->fetch($id, $this->relationships);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse(
            message: $this->lang("fetch-success"),
            payload: $this->resource($fetched)
        );
    }

    public function update(Request $request, string $id): JsonResponse
    {
        try {
            $data = $this->repository->validateData($request);
            $updated = $this->repository->update($data, $id);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse(
            message: $this->lang("update-success"),
            payload: $this->resource($updated)
        );
    }

    public function destroy(string $id): JsonResponse
    {
        try {
            $this->repository->delete($id);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse(
            message: $this->lang("delete-success")
        );
    }
}

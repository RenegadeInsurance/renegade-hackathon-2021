<?php
namespace Modules\Core\Traits;

use Illuminate\Database\QueryException;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;

trait ExceptionHandler
{
    public array $exception_messages;
    public array $exception_status_codes;

    public function getExceptionStatus(object $exception): int
    {
        return array_merge([
            ValidationException::class => 422,
            ModelNotFoundException::class => 404,
            QueryException::class => 400,
            UnauthorizedHttpException::class => 403,
        ], $this->exception_status_codes)[get_class($exception)] ?? 500;
    }

    public function getExceptionMessage(object $exception): string
    {
        return array_merge([
            ValidationException::class => json_encode(
                method_exists($exception, "errors")
                    ? $exception->errors()
                    : []
            ),
        ], $this->exception_messages)[get_class($exception)] ?? $exception->getMessage();
    }
}

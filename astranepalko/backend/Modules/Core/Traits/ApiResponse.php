<?php
namespace Modules\Core\Traits;

use Illuminate\Http\JsonResponse;

trait ApiResponse
{
    public function response(
        string $message,
        $payload = null,
        bool $status = true,
        int $response_code = 200
    ): JsonResponse {
        $response = [
            "success" => $status,
            "message" => json_decode($message) ?? $message,
            "payload" => is_object($payload)
                ? $payload->response()->getData(true)
                : ["data" => $payload],
        ];

        if ($payload == null) {
            unset($response["payload"]);
        }

        return response()->json($response, $response_code);
    }

    public function successResponse(string $message, $payload = null, int $response_code = 200): JsonResponse
    {
        return $this->response(
            message: $message,
            payload: $payload,
            response_code: $response_code
        );
    }

    public function errorResponse(string $message, int $response_code = 500): JsonResponse
    {
        return $this->response(
            message: $message,
            status: false,
            response_code: $response_code
        );
    }
}

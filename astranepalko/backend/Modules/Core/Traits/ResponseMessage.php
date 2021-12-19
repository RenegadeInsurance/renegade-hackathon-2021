<?php
namespace Modules\Core\Traits;

use Illuminate\Support\Str;

trait ResponseMessage
{
    public string $model_name;
    public array $response_messages;

    public function lang(string $key, ?string $name = null, ?string $lang_file = null): string
    {
        $name = $name ?? $this->model_name;
        $lang_file = $lang_file ?? "core::response";
        $response_messages = array_merge([
            "fetch-all-success" => __("{$lang_file}.fetch-success", ["name" => Str::plural($name)]),
        ], ...array_map(function ($message) use ($name, $lang_file) {
            return [
                $message => __("{$lang_file}.{$message}", ["name" => $name])
            ];
        }, array_merge([
            "fetch-success",
            "store-success",
            "update-success",
            "delete-success",

            "not-found",
            "fetch-error",
            "store-error",
            "update-error",
            "delete-error",

            "login-success",
            "login-error",
            "logout-success",
            "register-success",
            "register-error",
            "not-authenticated",
            "not-authorized",
        ], $this->response_messages)));

        return $response_messages[$key] ?? $key;
    }
}

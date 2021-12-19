<?php
namespace Modules\Core\Traits;

use Exception;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

trait UploadFile
{
    public function uploadFiles(
        array $files,
        bool $random = false,
        ?string $folder = null,
        ?string $description = null
    ): array {
        try {
            $file_infos = array_map(function ($file) use ($random, $folder, $description) {
                $original_name = $file->getClientOriginalName();
                $file_extension = pathinfo($original_name)["extension"];
                $identifier = Str::random(5);
                $file_identifier = Str::random(10);

                $file_name = $random ? "{$file_identifier}.{$file_extension}" : $original_name;

                $folder = $folder ?? "images";
                $location = "{$folder}/{$identifier}";

                $file_path = Storage::putFileAs($location, $file, $file_name);
                $file_info = getimagesize(Storage::path($file_path));

                return [
                    "size" => Storage::size($file_path),
                    "path" => $file_path,
                    "mime" => $file_info["mime"],
                    "width" => $file_info[0],
                    "height" => $file_info[1],
                    "dimension" => "{$file_info[0]} x {$file_info[1]}",
                    "orignal_name" => $original_name,
                    "description" => $description ?? $original_name
                ];
            }, $files);
        } catch (Exception $exception) {
            throw $exception;
        }

        return $file_infos;
    }

    public function uploadFile(
        object $file,
        bool $random = false,
        ?string $folder = null,
        ?string $description = null
    ): array {
        try {
            $file_info = $this->uploadFiles([$file], $random, $folder, $description)[0];
        } catch (Exception $exception) {
            throw $exception;
        }

        return $file_info;
    }
}

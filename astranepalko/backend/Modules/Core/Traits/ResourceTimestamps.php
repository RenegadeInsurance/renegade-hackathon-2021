<?php
namespace Modules\Core\Traits;

trait ResourceTimestamps
{
    public function timestamps(): array
    {
        return [
            "created_at" => $this->created_at,
            "updated_at" => $this->updated_at,
            "created_at_human" => $this->created_at->diffForHumans(),
            "updated_at_human" => $this->updated_at->diffForHumans(),
        ];
    }

    public function convert(array $resource): array
    {
        return array_merge($resource, $this->timestamps());
    }
}

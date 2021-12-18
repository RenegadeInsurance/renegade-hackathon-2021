<?php
namespace Modules\Core\Traits;

use Illuminate\Http\Resources\Json\JsonResource;

trait Transformable
{
    public object $transformer;

    public function collection(object $resources): JsonResource
    {
        return $this->transformer->collection($resources);
    }

    public function resource(object $resource): JsonResource
    {
        return $this->transformer->make($resource);
    }
}

<?php

namespace Modules\Core\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class BaseResource extends JsonResource
{
    public function toArray($request): array
    {
        return parent::toArray($request);
    }
}

<?php
namespace Modules\Assesment\Repositories;

use Modules\Assesment\Entities\Flow;
use Modules\Core\Repositories\BaseRepository;

class FlowRepository extends BaseRepository
{
    public function __construct(Flow $flow)
    {
        $this->model = $flow;
        $this->model_name = "Flow";
        $this->model_key = "flows";

        $this->rules = [
            "name" => "required",
        ];
    }
}

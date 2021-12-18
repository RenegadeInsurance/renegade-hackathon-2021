<?php

namespace Modules\Assesment\Http\Controllers\Api;

use Modules\Assesment\Entities\Flow;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Assesment\Repositories\FlowRepository;

class FlowController extends BaseController
{
    public function __construct(Flow $flow, FlowRepository $flow_repository)
    {
        $this->model = $flow;
        $this->model_name = "Flow";
        $this->repository = $flow_repository;
        parent::__construct();
    }
}

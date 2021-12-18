<?php

namespace Modules\Assesment\Http\Controllers\Api;

use Modules\Assesment\Entities\FlowRelation;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Assesment\Repositories\FlowRelationRepository;

class FlowRelationController extends BaseController
{
    public function __construct(FlowRelation $flowRelation, FlowRelationRepository $flowRelation_repository)
    {
        $this->model = $flowRelation;
        $this->model_name = "Flow Relation";
        $this->repository = $flowRelation_repository;
        parent::__construct();
    }
}

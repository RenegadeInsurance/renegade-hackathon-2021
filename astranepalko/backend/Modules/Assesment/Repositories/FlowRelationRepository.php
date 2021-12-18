<?php
namespace Modules\Assesment\Repositories;

use Modules\Assesment\Entities\FlowRelation;
use Modules\Core\Repositories\BaseRepository;

class FlowRelationRepository extends BaseRepository
{
    public function __construct(FlowRelation $flowRelation)
    {
        $this->model = $flowRelation;
        $this->model_name = "Flow Relation";
        $this->model_key = "flow_relations";

        $this->rules = [
            "question_id" => "required",
            "answer_id" => "required",
            "next_id" => "required|nullable",
        ];
    }
}

<?php

namespace Modules\Assesment\Http\Controllers\Api;

use Modules\Assesment\Entities\Answer;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Assesment\Repositories\AnswerRepository;

class AnswerController extends BaseController
{
    public function __construct(Answer $answer, AnswerRepository $answer_repository)
    {
        $this->model = $answer;
        $this->model_name = "Answer";
        $this->repository = $answer_repository;
        parent::__construct();
    }
}

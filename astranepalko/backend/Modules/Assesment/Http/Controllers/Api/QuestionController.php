<?php

namespace Modules\Assesment\Http\Controllers\Api;

use Modules\Assesment\Entities\Question;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Assesment\Repositories\QuestionRepository;

class QuestionController extends BaseController
{
    public function __construct(Question $question, QuestionRepository $question_repository)
    {
        $this->model = $question;
        $this->model_name = "Question";
        $this->repository = $question_repository;
        parent::__construct();
    }
}

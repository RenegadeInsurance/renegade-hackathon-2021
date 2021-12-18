<?php

namespace Modules\Assesment\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\Assesment\Entities\Question;
use Illuminate\Contracts\Support\Renderable;
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

<?php
namespace Modules\Assesment\Repositories;

use Modules\Assesment\Entities\Question;
use Modules\Core\Repositories\BaseRepository;

class QuestionRepository extends BaseRepository
{
    public function __construct(Question $question)
    {
        $this->model = $question;
        $this->model_name = "Question";
        $this->model_key = "Questions";

        $this->rules = [
            "question" => "required",
            "weight" => "required|numeric",
        ];
    }
}

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
            "name" => "required",
            "subject_id" => "sometimes|required|exists:subjects,id",
        ];
    }
}

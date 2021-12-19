<?php
namespace Modules\Assesment\Repositories;

use Modules\Assesment\Entities\Answer;
use Modules\Core\Repositories\BaseRepository;

class AnswerRepository extends BaseRepository
{
    public function __construct(Answer $answer)
    {
        $this->model = $answer;
        $this->model_name = "Answer";
        $this->model_key = "answers";

        $this->rules = [
            "answer" => "required",
            "weight" => "required|numeric",
        ];
    }
}

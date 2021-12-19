<?php
namespace Modules\Response\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\Assesment\Entities\Flow;
use Modules\Response\Entities\ResponseUser;

class ResponseFactory extends Factory
{
    protected $model = \Modules\Response\Entities\Response::class;

    public function definition()
    {
        $question = Flow::first()->question;

        $solved_answers = [];
        $unsolved_answers = [];

        while (true) {
            $answer = $question->answers_data->random(1)->first();
            $solved_answers[] = [
                "question_id" => $question->_id,
                "answer_id" => $answer->_id,
                "is_answered" => true,
                "answer_weight" => $answer->weight,
                "question_weight" => $question->weight,
                "weight" => $answer->weight * $question->weight,
            ];

            foreach ($question->answers_data as $answer_data) {
                if ($answer_data->_id == $answer->_id) {
                    continue;
                }

                $unsolved_answers[] = [
                    "question_id" => $question->_id,
                    "answer_id" => $answer_data->_id,
                    "is_answered" => false,
                    "answer_weight" => 0,
                    "question_weight" => $question->weight,
                    "weight" => 0,
                ];
            }

            $question = $answer->next;
            if ($question == null) {
                break;
            }
        }

        $final_weight_array = array_map(function ($answer) {
            return $answer['weight'];
        }, $solved_answers);
        $final_weight = array_sum($final_weight_array) / count($final_weight_array);

        return [
            "response_user_id" => ResponseUser::factory()->create()->_id,
            "answers" => array_merge($solved_answers, $unsolved_answers),
            "final_weight" => $final_weight,
        ];
    }
}


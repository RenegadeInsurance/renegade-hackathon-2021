<?php

namespace Modules\Assesment\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Assesment\Entities\Answer;
use Modules\Assesment\Entities\Flow;
use Modules\Assesment\Entities\FlowRelation;
use Modules\Assesment\Entities\Question;

class FlowRelationTableSeeder extends Seeder
{
    public function run()
    {
        Model::unguard();

        $answer_1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.5,
        ])->_id;

        $answer_2 = Answer::create([
            "answer" => "No",
            "weight" => 1,
        ])->_id;

        $question = Question::create([
            "question" => "Have you experienced one or more flooding events in your life?",
            "weight" => 0.5,
            "answers" => [$answer_1, $answer_2],
        ]);

        $flow = Flow::create([
            "name" => "Flood Risk Assessment",
            "question_id" => $question->_id,
        ]);

        $answer_a1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.1,
        ])->_id;

        $answer_a2 = Answer::create([
            "answer" => "No",
            "weight" => 0.5,
        ])->_id;

        $question_a = Question::create([
            "question" => "Has your municipality prepared an emergency plan?",
            "weight" => 0.5,
            "answers" => [$answer_a1, $answer_a2],
        ]);

        FlowRelation::create([
            "question_id" => $question->_id,
            "answer_id" => $answer_1,
            "next_id" => $question_a->_id,
        ]);
        FlowRelation::create([
            "question_id" => $question_a->_id,
            "answer_id" => $answer_a1,
            "next_id" => null,
        ]);
        FlowRelation::create([
            "question_id" => $question_a->_id,
            "answer_id" => $answer_a2,
            "next_id" => null,
        ]);

        $answer_b1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.3,
        ])->_id;

        $answer_b2 = Answer::create([
            "answer" => "No",
            "weight" => 0.8,
        ])->_id;

        $question_b = Question::create([
            "question" => "Has your municipality prepared an emergency plan?",
            "weight" => 0.5,
            "answers" => [$answer_b1, $answer_b2],
        ]);

        FlowRelation::create([
            "question_id" => $question->_id,
            "answer_id" => $answer_2,
            "next_id" => $question_b->_id,
        ]);

        $answer_c1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.8,
        ])->_id;

        $answer_c2 = Answer::create([
            "answer" => "No",
            "weight" => 0.2,
        ])->_id;

        $question_c = Question::create([
            "question" => "In your opnion, what is the flood risk area where you live?",
            "weight" => 0.5,
            "answers" => [$answer_c1, $answer_c2],
        ]);
        FlowRelation::create([
            "question_id" => $question_b->_id,
            "answer_id" => $answer_b1,
            "next_id" => $question_c->_id,
        ]);
        FlowRelation::create([
            "question_id" => $question_c->_id,
            "answer_id" => $answer_c1,
            "next_id" => null,
        ]);
        FlowRelation::create([
            "question_id" => $question_c->_id,
            "answer_id" => $answer_c2,
            "next_id" => null,
        ]);

        $answer_d1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.8,
        ])->_id;

        $answer_d2 = Answer::create([
            "answer" => "No",
            "weight" => 0.2,
        ])->_id;

        $question_d = Question::create([
            "question" => "Do you live near the river?",
            "weight" => 0.5,
            "answers" => [$answer_d1, $answer_d2],
        ]);
        FlowRelation::create([
            "question_id" => $question_b->_id,
            "answer_id" => $answer_b2,
            "next_id" => $question_c->_id,
        ]);
        FlowRelation::create([
            "question_id" => $question_c->_id,
            "answer_id" => $answer_c2,
            "next_id" => null,
        ]);

        $answer_e1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.8,
        ])->_id;

        $answer_e2 = Answer::create([
            "answer" => "No",
            "weight" => 0.2,
        ])->_id;

        $question_e = Question::create([
            "question" => "In your opnion, what is the flood risk area where you live?",
            "weight" => 0.5,
            "answers" => [$answer_e1, $answer_e2],
        ]);
        FlowRelation::create([
            "question_id" => $question_d->_id,
            "answer_id" => $answer_d2,
            "next_id" => $question_e,
        ]);
        FlowRelation::create([
            "question_id" => $question_e->_id,
            "answer_id" => $answer_e2,
            "next_id" => null,
        ]);

        $answer_f1 = Answer::create([
            "answer" => "Yes",
            "weight" => 0.8,
        ])->_id;

        $answer_f2 = Answer::create([
            "answer" => "No",
            "weight" => 0.2,
        ])->_id;

        $question_f = Question::create([
            "question" => "In your opnion, what is the flood risk area where you live?",
            "weight" => 0.5,
            "answers" => [$answer_f1, $answer_f2],
        ]);
        FlowRelation::create([
            "question_id" => $question_f->_id,
            "answer_id" => $answer_f1,
            "next_id" => null,
        ]);
        FlowRelation::create([
            "question_id" => $question_f->_id,
            "answer_id" => $answer_f2,
            "next_id" => null,
        ]);
    }
}

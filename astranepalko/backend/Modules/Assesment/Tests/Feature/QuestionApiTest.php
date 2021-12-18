<?php

namespace Modules\Assesment\Tests\Feature;

use Tests\TestCase;
use Modules\Assesment\Entities\Question;

class QuestionApiTest extends TestCase
{
    public function setUp(): void
    {
        $this->model = new Question();
        $this->model_name = "Question";
        $this->route_prefix = 'api.questions';

        parent::setUp();
    }
}

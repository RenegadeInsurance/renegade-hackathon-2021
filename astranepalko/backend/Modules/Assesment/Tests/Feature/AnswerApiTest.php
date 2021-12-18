<?php

namespace Modules\Assesment\Tests\Feature;

use Tests\TestCase;
use Modules\Assesment\Entities\Answer;

class AnswerApiTest extends TestCase
{
    public function setUp(): void
    {
        $this->model = new Answer();
        $this->model_name = "Answer";
        $this->route_prefix = 'api.answers';

        parent::setUp();
    }
}

<?php

namespace Modules\Assesment\Tests\Feature;

use Modules\Assesment\Entities\Question;
use Modules\Core\Tests\BaseTestCase;

class QuestionApiTest extends BaseTestCase
{
    public function setUp(): void
    {
        $this->model = new Question();
        $this->model_name = "Question";
        $this->route_prefix = 'api.questions';

        parent::setUp();
    }
}

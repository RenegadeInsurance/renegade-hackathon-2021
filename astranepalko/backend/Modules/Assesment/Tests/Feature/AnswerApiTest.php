<?php

namespace Modules\Assesment\Tests\Feature;

use Modules\Assesment\Entities\Answer;
use Modules\Core\Tests\BaseTestCase;

class AnswerApiTest extends BaseTestCase
{
    public function setUp(): void
    {
        $this->model = new Answer();
        $this->model_name = "Answer";
        $this->route_prefix = 'api.answers';

        parent::setUp();
    }
}

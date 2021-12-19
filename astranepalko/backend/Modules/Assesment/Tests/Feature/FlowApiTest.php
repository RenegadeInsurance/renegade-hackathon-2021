<?php

namespace Modules\Assesment\Tests\Feature;

use Modules\Assesment\Entities\Flow;
use Modules\Core\Tests\BaseTestCase;

class FlowApiTest extends BaseTestCase
{
    public function setUp(): void
    {
        $this->model = new Flow();
        $this->model_name = "Flow";
        $this->route_prefix = 'api.flows';

        parent::setUp();
    }
}

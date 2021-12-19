<?php

namespace Modules\Response\Http\Controllers\Api;

use Modules\Response\Entities\Response;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Response\Repositories\ResponseRepository;

class ResponseController extends BaseController
{
    public function __construct(Response $response, ResponseRepository $response_repository)
    {
        $this->model = $response;
        $this->model_name = "Response";
        $this->repository = $response_repository;
        parent::__construct();
    }
}

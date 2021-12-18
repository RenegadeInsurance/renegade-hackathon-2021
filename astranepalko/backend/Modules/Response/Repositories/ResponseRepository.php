<?php
namespace Modules\Response\Repositories;

use Modules\Response\Entities\Response;
use Modules\Core\Repositories\BaseRepository;

class ResponseRepository extends BaseRepository
{
    public function __construct(Response $response)
    {
        $this->model = $response;
        $this->model_name = "Response";
        $this->model_key = "responses";
    }
}

<?php
namespace Modules\Core\Tests;

use Tests\TestCase;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Modules\Core\Traits\ResponseMessage;

class BaseTestCase extends TestCase
{
    // use DatabaseTransactions;
    use ResponseMessage;

    protected array $headers;

    public object $model;
    public string $model_name;
    public string $route_prefix;
    public array $response_messages;

    public array $filters;
    public string $default_resource_id;
    public string $fake_resource_id;
    public int $factory_count;
    public bool $create_factories;
    public bool $has_filters;
    public bool $has_index_test;
    public bool $has_store_test;
    public bool $has_show_test;
    public bool $has_update_test;
    public bool $has_destroy_test;

    public function setUp(): void
    {
        parent::setUp();

        $this->headers = [];
        $this->response_messages = [];

        $this->model_name = $this->model_name ?? str_replace('Test', '', class_basename($this));
        $this->route_prefix = $this->route_prefix ?? strtolower($this->model_name);

        $this->filters = [
            "per_page" => 25,
            "sort_by" => "id",
            "sort_order" => "asc"
        ];

        $this->default_resource_id = $this->model::latest("id")->first()->id;
        $this->fake_resource_id = 0;
        $this->factory_count = 2;

        $this->create_factories = true;
        $this->has_filters = true;
        $this->has_index_test = true;
        $this->has_store_test = true;
        $this->has_show_test = true;
        $this->has_update_test = true;
        $this->has_destroy_test = true;
    }

    public function getRoute(string $method, array $parameters = []): string
    {
        return route("{$this->route_prefix}.{$method}", $parameters);
    }

    public function getCreateData(): array
    {
        return $this->model::factory()->make()->toArray();
    }

    public function getNonMandotaryCreateData(): array
    {
        return $this->getCreateData();
    }

    public function getInvalidCreateData(): array
    {
        return [];
    }

    public function getUpdateData(): array
    {
        return $this->getCreateData();
    }

    public function getNonMandotaryUpdateData(): array
    {
        return $this->getNonMandotaryCreateData();
    }

    public function getInvalidUpdateData(): array
    {
        return $this->getInvalidCreateData();
    }

    /**
     * GET method tests
     * 1. Assert if resource list can be fetched.
     * 2. Assert if resource list can be fetched with filters.
     * 3. Assert if individual resource can be fetched.
     * 4. Assert if the application returns error for invalid resource id.
     */

    public function testResourceListCanBeFetched(): void
    {
        if (!$this->has_index_test) {
            $this->markTestSkipped("Index method not available.");
        }
        if ($this->create_factories) {
            $this->model::factory($this->factory_count)->create();
        }

        $response = $this->withHeaders($this->headers)->get($this->getRoute("index"));

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("fetch-all-success")
        ]);
    }

    public function testResourceListCanBeFetchedWithFilters(): void
    {
        if (!$this->has_index_test) {
            $this->markTestSkipped("Index method not available.");
        }
        if (!$this->has_filters) {
            $this->markTestSkipped("Filters not available.");
        }

        $response = $this->withHeaders($this->headers)->get(
            $this->getRoute(
                method: "index",
                parameters: $this->filters
            )
        );

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("fetch-all-success")
        ]);
    }

    public function testIndividualResourceListCanBeFetched(): void
    {
        if (!$this->has_show_test) {
            $this->markTestSkipped("Show method not available.");
        }

        $response = $this->withHeaders($this->headers)->get(
            $this->getRoute(
                method: "show",
                parameters: [$this->default_resource_id]
            )
        );

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("fetch-success")
        ]);
    }

    public function testShouldReturnErrorForInvalidResourceId(): void
    {
        if (!$this->has_show_test) {
            $this->markTestSkipped("Show method not available.");
        }

        $response = $this->withHeaders($this->headers)->get(
            $this->getRoute(
                method: "show",
                parameters: [$this->fake_resource_id]
            )
        );

        $response->assertNotFound();
        $response->assertJsonFragment([
            "success" => false,
            "message" => $this->lang("not-found")
        ]);
    }

    /**
     * POST method tests
     * 1. Assert if resource can be created.
     * 2. Assert if resource can be created with non-mandotary data.
     * 3. Assert if the application returns error when invaid data is provided.
     */

    public function testResourceCanBeCreated(): void
    {
        if (!$this->has_store_test) {
            $this->markTestSkipped("Store method not available.");
        }

        $response = $this->withHeaders($this->headers)->post(
            uri: $this->getRoute("store"),
            data: $this->getCreateData()
        );

        $response->assertCreated();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("store-success")
        ]);
    }

    public function testResourceCanBeCreatedWithNonMandatoryData(): void
    {
        if (!$this->has_store_test) {
            $this->markTestSkipped("Store method not available.");
        }

        $response = $this->withHeaders($this->headers)->post(
            uri: $this->getRoute("store"),
            data: $this->getNonMandotaryCreateData()
        );

        $response->assertCreated();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("store-success")
        ]);
    }

    public function testShouldReturnErrorForInvalidCreateData(): void
    {
        if (!$this->has_store_test) {
            $this->markTestSkipped("Store method not available.");
        }

        $response = $this->withHeaders($this->headers)->post(
            uri: $this->getRoute("store"),
            data: $this->getInvalidCreateData()
        );

        $response->assertStatus(422);
        $response->assertJsonFragment([
            "success" => false
        ]);
    }

    /**
     * PUT method tests
     * 1. Assert if resource can be updated.
     * 2. Assert if resource can be updated with non-mandotary data.
     * 3. Assert if the application returns error when invaid data is provided.
     * 4. Assert if the application returns error when trying to update invalid resource.
    */

    public function testResourceCanBeUpdated(): void
    {
        if (!$this->has_update_test) {
            $this->markTestSkipped("Update method not available.");
        }

        $response = $this->withHeaders($this->headers)->put(
            uri: $this->getRoute(
                method: "update",
                parameters: [$this->default_resource_id]
            ),
            data: $this->getUpdateData()
        );

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("update-success")
        ]);
    }

    public function testResourceCanBeUpdatedWithNonMandatoryData(): void
    {
        if (!$this->has_update_test) {
            $this->markTestSkipped("Update method not available.");
        }

        $response = $this->withHeaders($this->headers)->put(
            uri: $this->getRoute(
                method: "update",
                parameters: [$this->default_resource_id]
            ),
            data: $this->getNonMandotaryUpdateData()
        );

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("update-success")
        ]);
    }

    public function testShouldReturnErrorForInvalidUpdateData(): void
    {
        if (!$this->has_update_test) {
            $this->markTestSkipped("Update method not available.");
        }

        $response = $this->withHeaders($this->headers)->put(
            uri: $this->getRoute(
                method: "update",
                parameters: [$this->default_resource_id]
            ),
            data: $this->getInvalidUpdateData()
        );

        $response->assertStatus(422);
        $response->assertJsonFragment([
            "success" => false
        ]);
    }

    public function testShouldReturnErrorForInvalidUpdateResource(): void
    {
        if (!$this->has_update_test) {
            $this->markTestSkipped("Update method not available.");
        }

        $response = $this->withHeaders($this->headers)->put(
            uri: $this->getRoute(
                method: "update",
                parameters: [$this->fake_resource_id]
            ),
            data: $this->getUpdateData()
        );

        $response->assertNotFound();
        $response->assertJsonFragment([
            "success" => false,
            "message" => $this->lang("not-found")
        ]);
    }

    /**
     * DELETE method tests
     * 1. Assert if resource can be deleted.
     * 2. Assert if the application returns error when trying to delete invalid resource.
     */

    public function testResourceCanBeDeleted(): void
    {
        if (!$this->has_destroy_test) {
            $this->markTestSkipped("Destroy method not available.");
        }

        $response = $this->withHeaders($this->headers)->delete(
            uri: $this->getRoute(
                method: "destroy",
                parameters: [$this->default_resource_id]
            )
        );

        $response->assertOk();
        $response->assertJsonFragment([
            "success" => true,
            "message" => $this->lang("delete-success")
        ]);
    }

    public function testShouldReturnErrorForInvalidDeleteResource(): void
    {
        if (!$this->has_destroy_test) {
            $this->markTestSkipped("Destroy method not available.");
        }

        $response = $this->withHeaders($this->headers)->delete(
            uri: $this->getRoute(
                method: "destroy",
                parameters: [$this->fake_resource_id]
            )
        );

        $response->assertNotFound();
        $response->assertJsonFragment([
            "success" => false,
            "message" => $this->lang("not-found")
        ]);
    }
}

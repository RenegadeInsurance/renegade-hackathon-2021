<?php
namespace Modules\Core\Traits;

use Exception;

trait Filterable
{
    public int $per_page = 25;

    public function validateFiltering(object $request): array
    {
        try {
            $rules = [
                "per_page" => "sometimes|numeric",
                "page" => "sometimes|numeric",
                "no_paginate" => "sometimes|boolean",
                "sort_by" => "sometimes",
                "sort_order" => "sometimes|in:asc,desc",
                "search" => "sometimes|string|min:1",
            ];
            $messages = [
                "per_page.numeric" => "Per page count must be a number.",
                "page.numeric" => "Page must be a number.",
                "no_paginate.boolean" => "No paginate must be true or false",
                "sort_order.in" => "Order must be 'asc' or 'desc'.",
                "search.string" => "Search query must be a string.",
                "search.min" => "Search query must be at least 1 character.",
            ];

            $data = $request->validate($rules, $messages);
        } catch (Exception $exception) {
            throw $exception;
        }

        return $data;
    }

    public function getFiltered(object $rows, object $request, array $with = []): object
    {
        try {
            $per_page = (int) ($request->per_page ?? $this->per_page);
            $sort_by = $request->sort_by ?? "id";

            if ($with != []) {
                $rows = $rows->with($with);
            }
            if ($request->has("search")) {
                $rows = $rows->whereLike($this->model::SEARCHABLE, "%{$request->search}%");
            }

            $rows = $request->sort_order == "asc"
                ? $rows->oldest($sort_by)
                : $rows->latest($sort_by);

            $resources = (bool) $request->no_paginate != true
                ? $rows->paginate($per_page)->appends($request->except("page"))
                : $rows->get();
        } catch (Exception $exception) {
            throw $exception;
        }

        return $resources;
    }
}

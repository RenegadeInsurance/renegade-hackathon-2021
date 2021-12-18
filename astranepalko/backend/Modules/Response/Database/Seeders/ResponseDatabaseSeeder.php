<?php

namespace Modules\Response\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class ResponseDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();
        $this->call(ResponseTableSeeder::class);

        // $this->call("OthersTableSeeder");
    }
}

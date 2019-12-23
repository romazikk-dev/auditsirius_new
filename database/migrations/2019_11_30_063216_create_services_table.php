<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title', 100);
            $table->string('desc_short', 255);
            $table->string('for_whom', 500);
            $table->string('terms', 500);
            $table->text('txt', 3000);
            $table->mediumInteger('price');
            $table->enum('type', array('accounting_support', 'auditing_services', 'consulting'));
            $table->mediumInteger('position')->nullable();
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('services');
    }
}

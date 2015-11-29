<?php

use yii\db\Migration;
use yii\db\Schema;

class m151127_080609_add_views_field_to_post extends Migration
{
    public function up()
    {
        $this->addColumn('post', 'views', Schema::TYPE_INTEGER . " AFTER poster_id");
    }

    public function down()
    {
        $this->dropColumn('post', 'views');
    }
}

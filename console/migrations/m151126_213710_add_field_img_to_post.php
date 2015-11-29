<?php

use yii\db\Migration;
use yii\db\Schema;

class m151126_213710_add_field_img_to_post extends Migration
{
    public function up()
    {
        $this->addColumn('post', 'img', Schema::TYPE_STRING . " AFTER description");
    }

    public function down()
    {
        $this->dropColumn('post', 'img');
    }
}

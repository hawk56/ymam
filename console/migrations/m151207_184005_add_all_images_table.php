<?php

use yii\db\Migration;
use yii\db\mysql\Schema;

class m151207_184005_add_all_images_table extends Migration
{
    public function up()
    {
        $this->createTable('all_images', [
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING,
            'upload_time' => Schema::TYPE_INTEGER
        ]);
    }

    public function down()
    {
        $this->dropTable('all_images');
        return false;
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}

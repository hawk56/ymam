<?php

use yii\db\Migration;
use yii\db\Schema;

class m151126_165319_create_category_table extends Migration
{
    public function up()
    {
        $this->createTable('category', [
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING,
            'status' => Schema::TYPE_INTEGER,
        ]);

        $this->addForeignKey('poster category', 'post', 'category', 'category', 'id');
    }

    public function down()
    {
        $this->dropTable('category');
    }
}

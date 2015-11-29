<?php

use yii\db\Migration;
use yii\db\Schema;

class m151126_162208_create_post_table extends Migration
{
    public function up()
    {
        $this->createTable('post', [
            'id' => Schema::TYPE_PK,
            'title' => Schema::TYPE_STRING,
            'description' => Schema::TYPE_TEXT,
            'text' => Schema::TYPE_TEXT,
            'seo_title' => Schema::TYPE_STRING,
            'seo_desc' => Schema::TYPE_STRING,
            'seo_keywords' => Schema::TYPE_STRING,
            'category' => Schema::TYPE_INTEGER,
            'poster_id' => Schema::TYPE_INTEGER,
            'created_at' => Schema::TYPE_INTEGER,
            'published_at' => Schema::TYPE_INTEGER,
            'updated_at' => Schema::TYPE_INTEGER,
            'status' => Schema::TYPE_INTEGER,
        ]);

        $this->addForeignKey('poster link', 'post', 'poster_id', 'user', 'id');
    }

    public function down()
    {
        $this->dropTable('post');
    }
}

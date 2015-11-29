<?php

use yii\db\Migration;
use yii\db\Schema;

class m151129_195452_add_comments_table extends Migration
{
    public function up()
    {
        $this->createTable('comment', [
            'id' => Schema::TYPE_PK,
            'user_id' => Schema::TYPE_INTEGER,
            'text' => Schema::TYPE_TEXT,
            'created_at' => Schema::TYPE_INTEGER
        ]);
        //$this->addForeignKey('poster comments', 'comment', 'user_id', 'user', 'id');
    }

    public function down()
    {
        $this->dropTable('comment');

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

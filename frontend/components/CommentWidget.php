<?php
/**
 * Created by PhpStorm.
 * Date: 30.11.2015
 * Time: 22:21
 */

namespace frontend\components;

use frontend\models\Comment;
use yii\base\Widget;

class CommentWidget extends Widget {

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
    }

    public function run()
    {
        $model = new Comment();
        return $this->render('comment', [
            'model' => $model
        ]);
        parent::run(); // TODO: Change the autogenerated stub
    }

}
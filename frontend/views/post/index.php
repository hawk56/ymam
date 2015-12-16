<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
use yii\widgets\LinkPager;

/* @var $this yii\web\View */
/* @var $searchModel common\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']) ?>
    </p>


    <?php
       /* echo ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' => '_post',
        ]);*/

        //die(print_r($posts));
        foreach ($posts as $post) {
            echo $this->render('_post', [
                'model' => $post,
            ]);
        }
    ?>
    <div>
    <?php
        echo LinkPager::widget([
            'pagination' => $pages,
        ]);
    ?>
    </div>

</div>

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

    <!--<?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'description:ntext',
            'text:ntext',
            'seo_title',
            // 'seo_desc',
            // 'seo_keywords',
            // 'category',
            // 'poster_id',
            // 'created_at',
            // 'published_at',
            // 'updated_at',
            // 'status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>-->

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

        echo LinkPager::widget([
            'pagination' => $pages,
        ]);
    ?>

</div>

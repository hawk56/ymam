<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <div class="wrapText">
        <img width="300" src="<?= \yii\helpers\Url::base(); ?>/upload/images/<?= $model->img ?>" alt="" style="float:left;">
        <p>
            <?= $model->text ?>
        </p>
    </div>
    <span class="label label-success">Просмотров: <?= $model->views; ?></span>
    <span class="label label-info">Дата публикации: <?= date('d/m/Y H:i:s', $model->created_at); ?></span>



    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'description:ntext',
            'text:ntext',
            'seo_title',
            'seo_desc',
            'seo_keywords',
            'category',
            'poster_id',
            'views',
            'created_at',
            'published_at',
            'updated_at',
            'status',
        ],
    ]) ?>

    <?php

        echo \frontend\components\CommentWidget::widget();

        foreach($com as $item)
        {
            echo $this->render('/comment/_view', [
                'model' => $item,
            ]);
        }

        /*echo "<pre>";
        print_r($com);
        echo "</pre>";*/
    ?>

</div>

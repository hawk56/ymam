<?php

use yii\helpers\Html;
use yii\helpers\HtmlPurifier;
use yii\helpers\Url;

if(!$model->img)
    $model->img = Url::base() . '/images/no_image.png';
else
    $model->img = Url::base() . '/upload/images/' . $model->img;

?>

<div class="post">
    <h2>
        <a href="<?= Url::toRoute(['view', 'id' => $model->id]); ?>">
            <img width="150" src="<?= $model->img; ?>" alt=""><br>
            <?= Html::encode($model->title) ?>
        </a>
    </h2>

    <?= HtmlPurifier::process($model->description) ?>
</div>
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
        <a class="art_link" href="<?= Url::toRoute(['view', 'id' => $model->id]); ?>" style="background-image: url(<?= $model->img; ?>);">
            <?= Html::encode($model->title) ?>
        </a>
    </h2>

    <?= HtmlPurifier::process($model->description) ?>
</div>
<?php

use yii\helpers\Html;
use yii\helpers\HtmlPurifier;
use yii\helpers\Url;

if(!$model->img)
    $model->img = Url::base() . '/images/no_image.png';
else
    $model->img = Url::base() . '/upload/images/' . $model->img;
$image = $model->getImage();
$img = '';
if($image)
{
    $img = $image->getUrl('230x140');
}

$lines = [
    'medium-teal-line',
    'dark-teal-line',
    'light-teal-line',
    'green-line',
    'yellow-line',
    'pink-line',
    'grey-line',
    'orange-line',
    'black-line',
    'red-line',
];
$line_class = $lines[rand(0, 9)];
?>

<div class="post">

        <a class="art_link" href="<?= Url::toRoute(['view', 'id' => $model->id]); ?>">
            <img class="<?= $line_class?>" src="<?= $img; ?>" alt="">
            <div class="article_title">
                <?= Html::encode($model->title) ?>
            </div>
            <div class="article_info">
                <i class="fa fa-eye"></i>&nbsp;<?= $model->views ?>
            </div>
        </a>



</div>
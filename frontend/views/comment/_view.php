<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

?>
<div class="comment-view">

    <h1>#<?= Html::encode($model->id) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'user_id',
            'text:ntext',
            'created_at',
        ],
    ]) ?>

</div>

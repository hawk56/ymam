<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 30.11.2015
 * Time: 22:23
 */
use yii\widgets\ActiveForm;
use yii\helpers\Html;
?>

<h3>Comment widget</h3>

<?php $form = ActiveForm::begin([
                    /*'action' => 'comment/comment/create',*/
                    'options' => ['enctype' => 'multipart/form-data']
                ]); ?>

<?= $form->field($model, 'text')->textarea(['rows' => 6]) ?>

<div class="form-group">
    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
</div>

<?php ActiveForm::end(); ?>

<?= Html::beginForm(['/post/create2'], 'POST', ['class' => 'form-horizontal', 'data-comment' => 'form', 'data-comment-action' => 'create']) ?>
<div class="form-group" data-comment="form-group">
    <div class="col-sm-12">
        <?= Html::activeTextarea($model, 'text', ['class' => 'form-control']) ?>
        <?= Html::error($model, 'content', ['data-comment' => 'form-summary', 'class' => 'help-block hidden']) ?>
    </div>
</div>
<?= Html::submitButton('submit', ['class' => 'btn btn-danger btn-lg']); ?>
<?= Html::endForm(); ?>

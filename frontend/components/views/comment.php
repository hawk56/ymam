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

<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "all_images".
 *
 * @property integer $id
 * @property string $name
 * @property integer $upload_time
 */
class AllImages extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'all_images';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['upload_time'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'upload_time' => 'Upload Time',
        ];
    }
}

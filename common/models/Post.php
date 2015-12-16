<?php

namespace common\models;

use Yii;
use common\models\User;



/**
 * This is the model class for table "post".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $text
 * @property string $seo_title
 * @property string $seo_desc
 * @property string $seo_keywords
 * @property integer $category
 * @property integer $poster_id
 * @property integer $created_at
 * @property integer $published_at
 * @property integer $updated_at
 * @property integer $status
 *
 * @property Category $category0
 * @property User $poster
 */
class Post extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post';
    }

    public function behaviors()
    {
        return [
            'image' => [
                'class' => 'rico\yii2images\behaviors\ImageBehave',
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'text', 'category'], 'required'],
            [['description', 'text'], 'string'],
            [['category', 'poster_id', 'views', 'created_at', 'published_at', 'updated_at', 'status'], 'integer'],
            [['title', 'img', 'seo_title', 'seo_desc', 'seo_keywords'], 'string', 'max' => 255],
            [['category'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category' => 'id']],
            [['poster_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['poster_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'description' => 'Description',
            'img' => 'Image',
            'text' => 'Text',
            'seo_title' => 'Seo Title',
            'seo_desc' => 'Seo Desc',
            'seo_keywords' => 'Seo Keywords',
            'category' => 'Category',
            'poster_id' => 'Poster ID',
            'views' => 'views',
            'created_at' => 'Created At',
            'published_at' => 'Published At',
            'updated_at' => 'Updated At',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory0()
    {
        return $this->hasOne(Category::className(), ['id' => 'category']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPoster()
    {
        return $this->hasOne(User::className(), ['id' => 'poster_id']);
    }


}

<?php

namespace frontend\controllers;

use common\models\Category;
use common\models\User;
use frontend\models\AllImages;
use frontend\models\Comment;
use Yii;
use common\models\Post;
use common\models\PostSearch;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use common\models\UploadForm;
use yii\web\Response;
use yii\web\UploadedFile;
use yii\data\Pagination;
use yii\widgets\ActiveForm;

/**
 * PostController implements the CRUD actions for Post model.
 */
class PostController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex($id=0)
    {
        if($id > 0)
        {
            $query = Post::find()->where(['category' => $id]);
            //die(print_r($query));

            $pages = new Pagination([
                'totalCount' => Post::find()->where(['category' => $id])->count(),
                'pageSize' => 8
            ]);

            $posts = $query->offset($pages->offset)
                ->limit($pages->limit)
                ->all();

            $all_posts = new ActiveDataProvider([
                'query' => $query->offset($pages->offset)
                    ->limit($pages->limit)
                    ->all(),
            ]);

            /*$all_posts = new ActiveDataProvider([
                'query' => Post::find(),
                'pagination' => [
                    'totalCount' => $countQuery->count(),
                    'pageSize' => 5
                ],
            ]);*/

            return $this->render('index', [
                'allPosts' => $all_posts,
                'pages' => $pages,
                'posts' => $posts,
            ]);
        }
        else {
            $searchModel = new PostSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $query = Post::find();
            $countQuery = clone $query;
            $pages = new Pagination([
                'totalCount' => $countQuery->count(),
                'pageSize' => 8
            ]);

            $posts = $query->offset($pages->offset)
                ->limit($pages->limit)
                ->all();

            $all_posts = new ActiveDataProvider([
                'query' => $query->offset($pages->offset)
                    ->limit($pages->limit)
                    ->all(),
            ]);

            /*$all_posts = new ActiveDataProvider([
                'query' => Post::find(),
                'pagination' => [
                    'totalCount' => $countQuery->count(),
                    'pageSize' => 5
                ],
            ]);*/

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'allPosts' => $all_posts,
                'pages' => $pages,
                'posts' => $posts,
            ]);
        }
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = Post::find()
            ->where(['id' => $id])
            ->one();
        $model->views++;
        $model->save();

        $com = Comment::find()->all();

        Yii::$app->view->registerMetaTag([
            'name' => 'description',
            'content' => $model->description
        ]);
        Yii::$app->view->registerMetaTag([
            'name' => 'keywords',
            'content' => $model->seo_keywords
        ]);

        $model_com = new Comment();

        if ($model_com->load(Yii::$app->request->post()) && $model_com->save()) {
            //return $this->redirect(['view', 'id' => $model->id]);
        } else {
            /*return $this->render('create', [
                'model' => $model,
            ]);*/
        }

        return $this->render('view', [
            'model' => $this->findModel($id),
            'com' => $com,
            'model_com' => $model_com,
        ]);
    }

    public function actionCreate2()
    {
        $model = new \vova07\comments\models\frontend\Comment(['scenario' => 'create']);
        Yii::$app->response->format = Response::FORMAT_JSON;

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                if ($model->save(false)) {
                    return $this->tree($model);
                } else {
                    Yii::$app->response->setStatusCode(500);
                    return Module::t('comments', 'FRONTEND_FLASH_FAIL_CREATE');
                }
            } elseif (Yii::$app->request->isAjax) {
                Yii::$app->response->setStatusCode(400);
                return ActiveForm::validate($model);
            }
        }
    }

    /**
     * Creates a new Post model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Post();
        $categories = Category::find()->select(['name', 'id'])->indexBy('id')->column();
        $user = Yii::$app->user->identity;

        if (Yii::$app->request->isPost) {
            $model->img = UploadedFile::getInstance($model, 'img');

            if($model->img)
            {
                $imageName = md5(time() . $model->img->baseName);
                $path = Yii::getAlias('@webroot/upload/images/').$imageName. "." .$model->img->extension;
                $model->img->saveAs($path);
                $imageFile = $imageName . "." .$model->img->extension;
            }

        }

        if ($model->load(Yii::$app->request->post())) {
            $model->img = $imageFile;
            $model->created_at = time();
            $model->updated_at = 0;
            $model->poster_id = $user->id;
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'category' => $categories,
            ]);
        }
    }

    public function actionUpload()
    {
        $model = new Post();
        //die(print_r($_POST));
        if (Yii::$app->request->isPost) {
            $model->img = UploadedFile::getInstance($model, 'img');
            if($model->img)
            {
                $imageName = md5(time() . $model->img->baseName);
                $path = Yii::getAlias('@webroot/upload/images/').$imageName. "." .$model->img->extension;
                $model->img->saveAs($path);
                $imageFile = $imageName . "." .$model->img->extension;

                $images = new AllImages();
                $images->name = $imageFile;
                $images->upload_time = time();
                $images->save();
                $path_4_json = 'http://localhost/y-mam/frontend/web/upload/images/'.$imageFile;
                Yii::$app->response->format = Response::FORMAT_JSON;
                //$model->attachImage($path);
                $items['files'][] = [
                    'deleteType' => "DELETE",
                    'deleteUrl' => $path_4_json,
                    'name' => $path_4_json,
                    'size' => 34269,
                    'thumbnailUrl' => $path,
                    'type' => "image/jpeg",
                    'url' => $path,
                ];
                return $items;
            }

        }

            /*return $this->render('create', [
                'model' => $model,
            ]);*/
    }

    /**
     * Updates an existing Post model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = Post::find()->where(['id'=>$id])->one();//$this->findModel($id);
        $categories = Category::find()->select(['name', 'id'])->indexBy('id')->column();
        $user = Yii::$app->user->identity;

        //$model = new UploadForm();

        /*if (Yii::$app->request->isPost) {
            $model->img = UploadedFile::getInstance($model, 'img');

            if($model->img)
            {
                $imageName = md5(time() . $model->img->baseName);
                $path = Yii::getAlias('@webroot/upload/images/').$imageName. "." .$model->img->extension;
                $model->img->saveAs($path);
                $imageFile = $imageName . "." .$model->img->extension;
                $model->attachImage($path);
            }

        }*/

        if ($model->load(Yii::$app->request->post())) {
            //$model->img = $imageFile;
            $model->updated_at = time();
            $model->poster_id = $user->id;
            $model->save();
            $model->img = UploadedFile::getInstance($model, 'img');

            if($model->img)
            {
                $imageName = md5(time() . $model->img->baseName);
                $path = Yii::getAlias('@webroot/upload/images/').$imageName. "." .$model->img->extension;
                $model->img->saveAs($path);
                $imageFile = $imageName . "." .$model->img->extension;
                $image = $model->getImage();
                if($image)
                {
                    $model->removeImage($image);
                }
                $model->attachImage($path);
            }
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'category' => $categories,
            ]);
        }
    }


    /**
     * Deletes an existing Post model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

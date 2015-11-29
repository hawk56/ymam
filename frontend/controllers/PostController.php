<?php

namespace frontend\controllers;

use common\models\Category;
use common\models\User;
use Yii;
use common\models\Post;
use common\models\PostSearch;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use common\models\UploadForm;
use yii\web\UploadedFile;
use yii\data\Pagination;

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
    public function actionIndex()
    {
        $searchModel = new PostSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        $query = Post::find();
        $countQuery = clone $query;
        $pages = new Pagination([
            'totalCount' => $countQuery->count(),
            'pageSize' => 5
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
            'posts' => $posts
        ]);
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

        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
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
            $model->updated_at = time();
            $model->poster_id = $user->id;
            $model->save();
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

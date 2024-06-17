<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "zayavki".
 *
 * @property int $id
 * @property string $description
 * @property int $category_id
 * @property int $user_id
 * @property int $status_id
 *
 * @property Categories $category
 * @property Statuses $status
 * @property Users $user
 */
class Zayavki extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'zayavki';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['description', 'category_id', 'user_id', 'status_id'], 'required'],
            [['description'], 'string'],
            [['category_id', 'user_id', 'status_id'], 'integer'],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::class, 'targetAttribute' => ['category_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => Users::class, 'targetAttribute' => ['user_id' => 'id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => Statuses::class, 'targetAttribute' => ['status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'description' => 'Description',
            'category_id' => 'Category ID',
            'user_id' => 'User ID',
            'status_id' => 'Status ID',
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Categories::class, ['id' => 'category_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Statuses::class, ['id' => 'status_id']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(Users::class, ['id' => 'user_id']);
    }
}

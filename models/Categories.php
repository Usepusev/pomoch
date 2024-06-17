<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categories".
 *
 * @property int $id
 * @property string $category
 *
 * @property Zayavki[] $zayavkis
 */
class Categories extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categories';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category'], 'required'],
            [['category'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category' => 'Category',
        ];
    }

    /**
     * Gets query for [[Zayavkis]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZayavkis()
    {
        return $this->hasMany(Zayavki::class, ['category_id' => 'id']);
    }
}

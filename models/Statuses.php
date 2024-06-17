<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "statuses".
 *
 * @property int $id
 * @property string $status
 *
 * @property Zayavki[] $zayavkis
 */
class Statuses extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'statuses';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['status'], 'required'],
            [['status'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'status' => 'Status',
        ];
    }

    /**
     * Gets query for [[Zayavkis]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZayavkis()
    {
        return $this->hasMany(Zayavki::class, ['status_id' => 'id']);
    }
}

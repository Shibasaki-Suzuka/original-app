# DB 設計

## users table

| Column              | Type          | Options                   |
|---------------------|---------------|---------------------------|
| nickname            | string        | null: false, unique: true |
| email               | string        | null: false, unique: true |
| encrypted_password  | string        | null: false               |
| last_name           | string        | null: false               |
| first_name          | string        | null: false               |
| last_name_hiragana  | string        | null: false               |
| first_name_hiragana | string        | null: false               |
| birthday            | date          | null: false               |

### Association

* has_many :dreams
* has_many :friends
* has_many :achieves

## dreams table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| dream_list    | string          | null: false                   |
| cost          | integer         |                               |
| due           | string          |                               |
| memo          | text            |                               |
| user          | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
* belongs_to :favorite
* has_many   :achieves 

## achieves table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| comment       | text            |                               |
| success_day   | date            | null: false                   |
| dream         | references      | null: false, foreign_key: true|
| user          | references      | null: false, foreign_key: true|

### Association

* belongs_to :dream
* belongs_to :user

## favorites table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| dream         | references      | null: false, foreign_key: true|

### Association

* belongs_to :dream

## friend table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| user          | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
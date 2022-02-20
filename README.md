# Приложение "Шашлычная"
#### Приложение, в котором можно спланировать совместные мероприятия, добавлять фотографии, оставлять комментарии. Так же можно увидеть геолокацию мероприятия на карте.

Проект написан на Ruby on Rails 6.1.4

#### Ссылка на приложение
https://pinchito.herokuapp.com/

https://eventsacademy.ru/

### Установка приложения:
Внимание! Перед запуском миграции нужно сконфигурировать файл **config/database.yml.example**
```ssh
git clone git@github.com:MAXimumCode/BBQ.git bbq
cd bbq
bundle install
bundle exec rails db:migrate
```

#### AMAZON S3
Получить ключи можно тут: https://aws.amazon.com/
```
S3_ACCESS_KEY = <amazon s3 access key>
S3_BUCKET_NAME = <amazon s3 bucket name>
S3_SECRET_KEY = <amazon s3 secret key>
S3_BUCKET_REGION = <s3 region> (example: us-east-2)
```


### Запуск сервера
```ssh
bundle exec rails s
```

### Автор
[Максим Козаев](https://maximumcode.github.io/CV/)
 

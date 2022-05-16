# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# универсальный парсер
# база postgress 
# 1) создать таблицу massages для сущности сообщение. url(ссылка на сообщение), текст(текст сообщения), ссылка на схему(ссылка на схему работы, аналогия коммунды, пока не использую), project ссылка на проект, ссылка на фото, ссылка на профиль хозяина объявления
# 2 схема обработки сообщений, работа с словорями, формула работы типа 11110 или 10010 или 100000 
# 3 админка для пункта 1
# 4 настройка крона для задания
# 5 правила прохода по сайту для поиска объявлений, как искать на авито, юле, ау ру, инсте, вк

#    -------------------------------------------2022---------------------------------------------
# 1) список урлов с поисковыми запросами.  
# типа 
# https://www.avito.ru/krasnoyarsk/mebel_i_interer/tekstil_i_kovry/postelnoe_belyo-ASgBAgICAkRasgLQww3E4Dk?s=104
# https://www.avito.ru/krasnoyarsk/mebel_i_interer/tekstil_i_kovry-ASgBAgICAURasgI?cd=1&q=%D0%BD%D0%B0%D0%B2%D0%BE%D0%BB%D0%BE%D1%87%D0%BA%D0%B0&s=104

# как бьло в  старом боте. то есть у нас нет фраз для поиска есть сразу урлы
# таблица вес, значение, 
# -30 цена от, -30 доставка по красноярску, -30 цену уточняйте 
# +10 200*220, +10 220*240
# 0 на резинке?

# !!!! у каждого объявления выводить его рейтинг и словестный рейтинг
# git config user.email your@email.com
# git config --global user.email your@email.com  
# локальная почта должна быть как в гите, тогда видно вклады


#добавляем данные словарей в проект так!  
#1 варинт
#https://www.youtube.com/watch?v=m1ZWfOAwyxc
#https://webformyself.com/peretaskivanie-elementov-s-vanilla-js-i-html/
#2 вариант !!!!
# https://itchief.ru/javascript/jquery-add-delete-elements#move
#https://itchief.ru/examples/lab.php?topic=jquery&file=manipulation-example-18
#3 ищи еще аналогов
/* 1 */
{
    "_id" : ObjectId("61de8e938040180b24f74142"),
    "ves" : -30,
    "word" : "цена от",
    "comment" : "скорее всего магазин",
    "updated_at" : ISODate("2022-01-12T08:17:23.499Z"),
    "created_at" : ISODate("2022-01-12T08:17:23.499Z")
}

/* 2 */
{
    "_id" : ObjectId("61dea70a8040180b24f74143"),
    "ves" : -30,
    "word" : "доставка по красноярску",
    "comment" : "скорее всего магазин",
    "updated_at" : ISODate("2022-01-12T10:01:46.422Z"),
    "created_at" : ISODate("2022-01-12T10:01:46.422Z")
}

/* 3 */
{
    "_id" : ObjectId("61deab6d8040180b24f7414d"),
    "ves" : -30,
    "word" : "цену уточняйте",
    "comment" : "заманушная цена",
    "updated_at" : ISODate("2022-01-12T10:20:29.284Z"),
    "created_at" : ISODate("2022-01-12T10:20:29.284Z")
}

/* 4 */
{
    "_id" : ObjectId("61dff54580401845a10071c6"),
    "ves" : 10,
    "word" : "200*220",
    "comment" : "тчн",
    "updated_at" : ISODate("2022-01-13T09:47:49.747Z"),
    "created_at" : ISODate("2022-01-13T09:47:49.747Z")
}

/* 5 */
{
    "_id" : ObjectId("61dff58380401845a10071c7"),
    "ves" : 10,
    "word" : "220*240",
    "comment" : "тчн",
    "updated_at" : ISODate("2022-01-13T09:48:51.982Z"),
    "created_at" : ISODate("2022-01-13T09:48:51.982Z")
}







/* 1 */
{
    "_id" : ObjectId("61dd3a2980401829b6a749c2"),
    "url" : "1",
    "head" : "2",
    "pr" : 3,
    "text" : "4",
    "link" : "5",
    "linksx" : "6",
    "dictionary" : "7",
    "photo" : "78",
    "phone" : "8",
    "updated_at" : ISODate("2022-01-11T08:04:57.329Z"),
    "created_at" : ISODate("2022-01-11T08:04:57.329Z")
}




open




/* 1 */
{
    "_id" : ObjectId("61de8e938040180b24f74142"),
    "name" : "Первый проект",
    "dictionars" : [ 
        {
            "_id" : ObjectId("61de8e938040180b24f74141")
        }, 
        {
            "_id" : ObjectId("61dea70a8040180b24f74143")
        }, 
        {
            "_id" : ObjectId("61deab6d8040180b24f7414d")
        }
    ],
    "updated_at" : ISODate("2022-01-12T08:17:23.499Z"),
    "created_at" : ISODate("2022-01-12T08:17:23.499Z")
}

хром драйвер
https://chromedriver.chromium.org/downloads
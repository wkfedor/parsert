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
# 1) создать таблицу massages для сущности сообщение. url(ссылка на сообщение), текст(текст сообщения), ссылка на схему(ссылка на схему работы, аналогия коммунды, пока не использую), ссылка на словари, ссылка на фото, ссылка на профиль хозяина объявления
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


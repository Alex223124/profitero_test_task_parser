# Тестовое задание для profitero. "Парсер"



### Описание задания:
Существует онлайн-магазин http://www.sammccauley.com/aspx/Homepage.aspx. На сайте представлены различные товары,
 в том числе такого вида: http://www.sammccauley.com/Product/loreal-colour-riche-lipliner/27631/2224.14.0.  
Такие продукты мы называем мультипродуктами, т.е. продуктами, у которых по одному урлу представлено несколько различных вариаций (в данном примере можно выбирать цвет). 


Нужно написать скрипт, который принимает на вход 2 параметра: 
урл с категорией товаров (пример: http://www.sammccauley.com/category/face/2224.14.0) 
и имя файла, куда будет складываться результат.

Результатом должен быть список всех товаров категории, причем у каждого товара должны быть указаны следующие параметры:
Название товара
Цена
Картинка (в виде ссылки на изображение)
Код товара


В случае мультипродуктов каждая вариация имеет свою цену и картинку, 
поэтому должна идти как отдельный товар. Имя продукта должно включать в себя вариацию (цвет, размер, обьем и т.д.). Формат файла: csv 

Примечание: в скрипте должны быть использованы библиотеки Curb и Nokogiri. Для работы с html-страницами следует использовать язык запросов Xpath.

### Текущее состояние:
Добавить обработку "multi products"

### Запуск

```
$ ruby interface.rb url file_name

```
Пример:

```
$ ruby interface.rb http://www.sammccauley.com/category/face/2224.14.0 product.csv

```

### Библиотеки

* ruby '2.2.2'

* Ruby-language bindings for the libcurl:
gem 'curb', '~> 0.9.3'

* HTML, XML, SAX, and Reader parser:
gem 'nokogiri', '~> 1.6', '>= 1.6.6.2'

* debugger:
gem 'pry'

### Источники информации:
http://www.w3schools.com/xml/xpath_nodes.asp
https://msdn.microsoft.com/ru-ru/library/ms256086(v=vs.120).aspx
http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html


### Как улучшить
* Поместить в библиотеку
* Использовать thor для выполнения в качестве команды
* Добавить тесты
* Добавить сохрание данных в других форматах 
* Версирование файлов с данными, защита от перезаписи

### Ожидаемый вывод в терминале:

alex@Alex:~/command_line_apps/profitero_test_task_parser$ ruby interface.rb http://www.sammccauley.com/category/face/2224.14.0 product1.csv
Script stated at 2016-12-18 02:42:10 +0300New record parsing started
Amazing Cosmetics Concealer Fair Golden  downloaded
New record parsing started
€12.48 downloaded
New record parsing started
http://www.SamMccauley.com/images/productImages/Large/amazing_cosmetics_concealer_fair_golden__1013915.jpg downloaded
New record parsing started
Item Code: 1013915 downloaded
New record parsing started
Anne Weeks Camoflage Cream  downloaded
New record parsing started
€40.00 downloaded
New record parsing started

.....


iaja Goats Milk Day Cream - Eye Cream Baned Pack downloaded
New record parsing started
€6.99 downloaded
New record parsing started
http://www.SamMccauley.com/images/productImages/Large/ziaja_goats_milk_day_cream___eye_cream_baned_pack_1027021.jpg downloaded
New record parsing started
Item Code: 1027021 downloaded
product1.csv updated
Script ended 2016-12-18 02:46:54 +0300





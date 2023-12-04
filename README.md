# A Medical API with RESFful feautures written in Ruby and PostgreSQL

Здравствуйте, это API. Я написал для службы онлайн-консультаций врачей.

# функции 
- обработка запроса на консультацию по созданию и сохранять данные пациентов в базе данных
- возможность врача ответить на рекомендательную консультацию пациента
- пациент может видеть все ответы и медицинские рекомендации, которые он получил по своим рекомендациям
- API автоматически получает данные медицинских рекомендаций из внешней службы **OpenFDA**, если пользователь не получил никаких рекомендаций от врача.


![ezgif-2-40dfe9177b](https://github.com/mahmoud0x01/Medical_API/assets/30966854/c629b30f-6688-4b8f-b5e6-543fa7d97f7a)




# Установка : 

- прежде всего клонируйте репозиторий с помощью **git** : `git clone https://github.com/mahmoud0x01/Medical_API.git && cd Medical_API/`
- отредактируйте переменные среды в файле **ext_conf.sh** в соответствии с конфигурацией вашего сервера Postgresql : 
  - **POSTGRESQL_USERNAME**
  - **POSTGRESQL_PASSWORD**
  - **POSTGRESQL_PORT**
  - **POSTGRESQL_HOST**

- выполнить следующую команду `source ext_conf.sh`
- установить необходимые модули с помощью Ruby bundle `bundle install`
- запуск сервера PostgreSql `service postgresql start`
- Создайте базу данных PostgreSQL, выполнив следующую команду `rails db:create`
- создание структуры и схемы базы данных с помощью следующей команды `rails db:migrate`
- запуск сервера `rails server`

теперь вы должны увидеть сообщение типа «сервер запущен

# Рабочий процесс API :
- сначала создайте запрос на консультацию, используя POST  `http://127.0.0.1:3000/consultation_requests`
- Затем вы можете, если вы врач, ответить на консультацию по идентификатору **request_id** , используя POST `http://127.0.0.1:3000/consultation_requests/:request_id/recommendations`
- далее вы сможете увидеть любую доступную рекомендацию для пациента по идентификации **patient_id** используя GET `http://127.0.0.1:3000/patients/:patient_id/recommendations/`
- если пользователь не получил рекомендации и вы хотите, чтобы API искал его с использованием внешних источников данных **OpenFDA** посетите `http://127.0.0.1:3000/patients/:patient_id/recommendations/` и если пользователь не получил рекомендации. API получит его для этого. просто перезагрузи тот же запрос GET чтобы получить новые полученные результаты


# тестирование :

**файлы внутри папки** `ext_test/` **Я написал внешнее использование для тестирования основных конечных точек API.** 
`cd ext_test/`
- GET `http://127.0.0.1:3000/patients/:patient_id/recommendations/` чтобы сделать тест , просто откройте URL-адрес в браузере и укажите **Patient_id** 
- POST  `http://127.0.0.1:3000/consultation_requests` чтобы сделать тест. выполнить скрипт **consultation_requests_tester.rb** `ruby consultation_requests_tester.rb`
- POST  `http://127.0.0.1:3000/consultation_requests/:request_id/recommendations` чтобы сделать тест. выполнить скрипт **recommendation_post_tester.rb** `ruby recommendation_post_tester.rb`


  

## Запуск
```shell
git clone git@github.com:bevis-ui/mvc-bevis-stub.git your-project
cd your-project
make
```
Команда `make` выкачает все необходимые инструменты, соберет единственную страницу и запустит локальный сервер.

Откройте в браузере `http://localhost:8080/`

## Запуск в Windows
Убедитесь, что в пути к проекту нет символов unicode, иначе это может привести к  [ошибкам](https://github.com/bevis-ui/bevis-stub/issues/9). 

```shell
git clone git@github.com:bevis-ui/mvc-bevis-stub.git your-project
cd your-project
npm install
node_modules\.bin\enb make
node_modules\.bin\supervisor -w server,configs -- server/boot.js
```
При выполнении последней комады может возникнуть следующая ошибка:
`Error: Cannot find module '../configs/current/env'`
Она связана с отсутвием символической ссылки на текущую конфигурацию проекта (configs\current). 
Чтобы ее создать, необходимо выполнить следующие команды:
```shell
rm configs\current
mklink /J configs\current configs\development
git update-index --assume-unchanged configs/current
```

## Как подключить свой репозиторий
```shell
git remote rename origin upstream
git remote add origin git@github.com:<ваш_аккаунт_на_гитхабе>/<имя_репозитория>.git
git push -u origin master
```
Теперь `origin` "смотрит" в ваш репозиторий. А `upstream` смотрит в оригинальный `github.com:bevis-ui/mvc-bevis-stub` 

Чтобы получить обновления из `github.com:bevis-ui/mvc-bevis-stub`, делаем `git pull` из `upstream`:
```
git pull upstream master
```

## Как сделать ещё одну страницу?
Запустить команду и ответить на вопрос:
```shell
make page
# Введите имя страницы: <ИМЯ СТРАНИЦЫ>
```
После на файловой системе станет доступна страница `client/pages/<ИМЯ СТРАНИЦЫ>/<ИМЯ СТРАНИЦЫ>-page.page.js`.

А в браузере она же по адресу `http://localhost:8080/<ИМЯ СТРАНИЦЫ>`


## Как сделать View?
Запустить команду и ответить на вопрос:
```shell
make view
# Введите имя View: <ИМЯ VIEW>
```
После на файловой системе станет доступна директория с файлами блока `client/views/<ИМЯ VIEW>`.

## Как сделать Хранилище переводов для какого-то View?
Запустить команду и ответить на вопрос:
```shell
make keyset
# Введите имя Keyset: <ИМЯ KEYSET>
```
После на файловой системе станет доступна директория с файлами блока 
`client/views/i18n/_keyset/i18n_keyset_<ИМЯ_БЛОКА>.i18n`.

Успехов! :)
```

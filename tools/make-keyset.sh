#!/bin/sh

echo ""
printf "Введите имя Keyset: "
read KeySet

if [ -d client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n ]; then
    echo "Операция прервана: keyset '$KeySet' уже существует."
    exit
fi


mkdir -p client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n

echo "module.exports = {
    \"$KeySet\": {
        \"my-key\": \"моё значение\"
    }
}; " > client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n/ru.js

echo "module.exports = {
    \"$KeySet\": {
        \"my-key\": \"my value\"
    }
}; " > client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n/en.js

echo "----------------------------------------------------------"
echo "Создан keyset client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n"
echo "----------------------------------------------------------"
ls -la client/views/i18n/_keyset/i18n_keyset_$KeySet.i18n

#!/bin/sh

echo ""
printf "Введите имя View: "
read BlockName

if [ -d client/views/$BlockName ]; then
    echo "Операция прервана: view '$BlockName' уже существует."
    exit
fi


mkdir -p client/views/$BlockName

echo ".$BlockName {
    /* здесь стили блока */
}" > client/views/$BlockName/$BlockName.styl

echo "module.exports = function (bt) {

    bt.match('$BlockName', function (ctx) {
        ctx.setTag('span');

        ctx.setContent('Содержимое блока');
    });

};" > client/views/$BlockName/$BlockName.bt.js

echo "modules.define(
    '$BlockName',
    [
        'inherit',
        'block'
    ],
    function (
        provide,
        inherit,
        YBlock
    ) {
        var $BlockName = inherit(YBlock, {
            __constructor: function () {
                this.__base.apply(this, arguments);
            }
        }, {
            getBlockName: function () {
                return '$BlockName';
            }
        });

        provide($BlockName);
});" > client/views/$BlockName/$BlockName.js

echo "-------------------------------------------------"
echo "Создан блок client/views//$BlockName"
echo "-------------------------------------------------"
ls -la client/views/$BlockName

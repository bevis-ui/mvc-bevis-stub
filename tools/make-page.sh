#!/bin/sh

echo ""
printf "Введите имя страницы: "
read PageName


if [ -d client/pages/$PageName-page  ]; then
    echo "Операция прервана: Директория с таким именем существует по адресу client/pages/$PageName-page"
    exit
fi

mkdir -p client/pages/$PageName-page
echo "- page
- app-controller
- page-controller
- block" > client/pages/$PageName-page/$PageName-page.deps.yaml

echo "module.exports = function (pages) {
    pages.declare('${PageName}-page', function (params) {
        var options = params.options;
        return {
            block: 'page',
            title: '${PageName} page',
            styles: [
                {url: options.assetsPath + '.css'}
            ],
            scripts: [
                {url: options.assetsPath + '.' + params.lang + '.js'}
            ],
            body: [
                // здесь ваши блоки
            ]
        };
    });
};" > client/pages/$PageName-page/$PageName-page.page.js

mkdir client/pages/$PageName-page/controllers
echo "modules.define(
    'page-controller',
    [
        'inherit'
    ],
    function (
        provide,
        inherit
    ) {

    var PageController = inherit({
        __constructor: function () {
            console.log('index: PageController constructor');
        }
    });

    provide(PageController);
});" > client/pages/$PageName-page/controllers/page-controller.js

echo "-------------------------------------------------"
echo "Создана страница client/pages/$PageName-page"
echo "-------------------------------------------------"
ls -la client/pages/$PageName-page

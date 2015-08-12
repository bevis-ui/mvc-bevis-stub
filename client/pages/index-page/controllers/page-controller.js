modules.define(
    'page-controller',
    [
        'inherit',
        'jquery',
        'sidebar'
    ],
    function (
        provide,
        inherit,
        $,
        SidebarView
    ) {

    var PageController = inherit({
        __constructor: function () {
            console.log('index: PageController constructor');
        },

        /**
         * Отображает контент или форму авторизации, елси пользователь незалогинен
         */
        start: function () {
            var sidebarView = new SidebarView({
                title: 'Привет, Бивис!',
                resources: [
                    {
                        text: 'Репозиторий',
                        url: 'https://github.com/bevis-ui/'
                    },
                    {
                        text: 'Учебник для новичков',
                        url: 'https://github.com/bevis-ui/docs/blob/master/manual-for-beginner.md'
                    },
                    {
                        text: 'Учебник для старичков',
                        url: 'https://github.com/bevis-ui/docs/blob/master/manual-for-master.md'
                    }
                ]
            });

            sidebarView.getDomNode().appendTo($('body'));
        }
    });

    provide(PageController);
});

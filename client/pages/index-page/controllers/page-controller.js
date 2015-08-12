modules.define(
    'page-controller',
    [
        'inherit',
        'jquery',
        'sidebar',
        'form',
        'y-i18n',
        'auth-model'
    ],
    function (
        provide,
        inherit,
        $,
        SidebarView,
        FormView,
        i18n,
        AuthModel
    ) {

    var PageController = inherit({
        __constructor: function () {
            console.log('index: PageController constructor');

            // Создали экземпляр Модели Авторизации
            this._authModel = new AuthModel();

            // Слушаем событие на модели
            // Произойдёт, когда модель успешно сохранит данные
            this._authModel.on('saved', this.start, this);
        },

        /**
         * Отображает контент или форму авторизации, елси пользователь незалогинен
         */
        start: function () {
            $('body').empty();

            // Спрашиваем у Модели, авторизован ли пользователь
            var isAuthorized = this._authModel.isAuthorized();

            if (isAuthorized) {
                // Получаем авторизационные данные
                var authData = this._authModel.get();

                // Отображаем контент с участием авторизационных данных
                var sidebarView = new SidebarView({
                    title: 'Привет, ' + authData.login + '!',
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

            } else {

                var formAuthView = new FormView({
                    titleText: i18n('form', 'title-text')
                });

                formAuthView.getDomNode().appendTo($('body'));
                formAuthView.on('form-submitted', this._onFormAuthSubmitted, this);
            }
        },

        /**
         * Обработчик сабмита на форме авторизации
         * @param {YEventEmitter} e
         */
        _onFormAuthSubmitted: function (e) {
            this._authModel.set(e.data);
        }
    });

    provide(PageController);
});
# language: ru

Функциональность: Получение состояния репозитория

Как разработчик
Я хочу иметь возможность получить состояние репозитория git
Чтобы мочь автоматизировать больше рутинных действий на OneScript

Контекст:
    Допустим Я создаю новый объект ГитРепозиторий
    И Я создаю временный каталог и сохраняю его в контекст
    И Я инициализирую репозиторий во временном каталоге

Сценарий: Получение состояния репозитория
    Когда Я получаю состояние репозитория
    Тогда Вывод команды содержит "master"

Сценарий: Получение короткого состояния репозитория
    Когда Я получаю короткое состояние репозитория
    Тогда Вывод команды не содержит "master"

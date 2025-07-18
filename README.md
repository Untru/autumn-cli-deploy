# PIVO CLI - Консольное приложение для автоматизации разработки 1С

Консольное приложение на базе **autumn-cli** для автоматизации процессов разработки, сборки и деплоя конфигураций 1С:Предприятие. Приложение предоставляет набор команд для работы с Git-репозиториями, управления ветками, коммитами, сборки обработок и обновления баз данных.
Работает совместно с 1с решением [GitManager](https://github.com/Untru/gitmanager)

## 🚀 Возможности

- **Управление Git-репозиториями**: создание веток, коммиты, merge request
- **Работа с конфигурациями 1С**: декомпиляция, компиляция, обновление
- **Управление обработками**: сборка, обновление, перенос в базу
- **Работа с расширениями**: загрузка и выгрузка расширений конфигурации
- **Управление кластером**: блокировка/разблокировка баз данных
- **Интеграция с GitLab**: автоматическое создание merge request
- **Интеграция с GitHub**: автоматическое создание merge request

## 📋 Требования

- **OneScript** (oscript) версии 1.8 или выше
- **1С:Предприятие** версии 8.3.24 или выше
- **Git** для работы с репозиториями
- **Доступ к кластеру 1С** и базе данных

## 🛠 Установка

1. Убедитесь, что OneScript установлен и доступен в PATH:
```bash
oscript --version
```

2. Установите пакет:
```bash
opm install pivo-cli
```

3. Для запуска используйте batch-файл или напрямую:
```bash
# Через batch-файл
main.bat

# Напрямую
oscript main.os
```

## 📖 Команды приложения

### 🔧 Основные команды

#### `init` - Инициализация репозитория
Клонирует Git-репозиторий переданный в опциях в папку указанную в опциях

**Параметры:**
- `PathRepository` - Путь к локальному репозиторию
- `PathRemoteRepository` - URL удаленного репозитория
- `UserName` - Имя пользователя Git
- `UserEmail` - Email пользователя Git

**Пример:**
```bash
oscript main.os init --PathRepository="C:\Projects\MyProject" --PathRemoteRepository="https://gitlab.com/company/myproject.git" --UserName="Developer" --UserEmail="dev@company.com"
```

#### `commit` - Создание коммита
Выполняет декомпиляцию конфигурации, обработок и расширений, затем создает коммит в Git.

**Параметры:**
- `PathRepository` - Путь к репозиторию
- `NameDB` - Имя информационной базы
- `UsrLogin1c` - Имя пользователя 1С
- `UsrPswd1c` - Пароль пользователя 1С
- `PathServer1с` - Путь к серверу 1С
- `NumberPlatform` - Номер версии платформы 1С 
- `TypeDB` - Тип СУБД (MSSQLServer, PostgreSQL, и т.д.)
- `ServerDB` - Имя сервера 
- `PathServerDB` - Путь к серверу СУБД
- `RunRas` - Запускать RAS (true/false)
- `Extensions` - Имена расширений конфигурации (через запятую)
- `TextCommit` - Текст коммита
- `UrlRemoteRepository` - URL удаленного репозитория !!!
- `TokenConnectionGitLab` - Токен подключения к GitLab !!!
- `IdProject` - ID проекта в GitLab !!!
- `MethodLoadDB` - Метод загрузки (ibcmd/designer)
- `LoadDB` - Обновлять базу из файлов (true/false)
- `CommitAuthor` - Автор коммита

Для ibcmd
- `UsrLoginDB` - Имя пользователя СУБД
- `UsrPswdDB` - Пароль пользователя СУБД


**Пример:**
```bash
oscript main.os commit --PathRepository="C:\Projects\MyProject" --NameDB="MyDatabase" --UsrLogin1c="admin" --UsrPswd1c="password" --PathServer1с="localhost" --NumberPlatform="8.3.11.1234" --TypeDB="MSSQLServer" --ServerDB="localhost" --UsrLoginDB="sa" --UsrPswdDB="password" --PathServerDB="localhost" --RunRas="true" --Extensions="Расширение1,Расширение2" --TextCommit="Обновление обработок" --UrlRemoteRepository="https://gitlab.com/company/myproject.git" --TokenConnectionGitLab="your-token" --IdProject="123" --MethodLoadDB="ibcmd" --LoadDB="true" --CommitAuthor="Developer"
```

#### `Branch` - Создание и настройка ветки
Создает новую ветку из develop, обновляет конфигурацию и компилирует обработки.

**Параметры:**
- `PathRepository` - Путь к репозиторию
- `NewBranch` - Имя новой ветки
- `NameDB` - Имя информационной базы
- `UsrLogin1c` - Имя пользователя 1С
- `UsrPswd1c` - Пароль пользователя 1С
- `PathServer1с` - Путь к серверу 1С
- `NumberPlatform` - Номер версии платформы 1С
- `TypeDB` - Тип СУБД
- `ServerDB` - Имя сервера SQL
- `UsrLoginDB` - Имя пользователя СУБД
- `UsrPswdDB` - Пароль пользователя СУБД
- `PathServerDB` - Путь к серверу СУБД
- `RunRas` - Запускать RAS
- `NamesDataProcessors` - Имена внешних обработок (через запятую)
- `Extensions` - Имена расширений конфигурации
- `LoadDB` - Обновлять базу из файлов
- `MethodLoadDB` - Метод загрузки (ibcmd/designer)
- `NameDBWeb` - Имя опубликованной базы
- `ServerDBWeb` - Сервер опубликованной базы
- `NotUseCluster` - Не использовать кластер
- `NotUseGit` - Не использовать Git

**Пример:**
```bash
oscript main.os Branch --PathRepository="C:\Projects\MyProject" --NewBranch="feature/new-processing" --NameDB="MyDatabase" --UsrLogin1c="admin" --UsrPswd1c="password" --PathServer1с="localhost" --NumberPlatform="8.3.11.1234" --TypeDB="MSSQLServer" --ServerDB="localhost" --UsrLoginDB="sa" --UsrPswdDB="password" --PathServerDB="localhost" --RunRas="true" --NamesDataProcessors="MyProcessing1,MyProcessing2" --Extensions="Расширение1,Расширение2" --LoadDB="true" --MethodLoadDB="ibcmd"
```

### 🔄 Дополнительные команды

#### `Branch-develop` - Переход на ветку develop
Переключается на ветку develop и обновляет конфигурацию.

#### `Branch-from-develop` - Создание ветки из develop
Создает новую ветку из develop с обновлением конфигурации.

#### `Branch-to-develop` - Слияние в develop
Выполняет слияние текущей ветки в develop.

#### `build-release` - Сборка релиза
Создает релизную сборку конфигурации.

#### `create-Branch` - Создание ветки
Создает новую ветку без дополнительных операций.

#### `create-merge-request` - Создание merge request
Создает merge request в GitLab.

#### `block` - Блокировка базы
Блокирует информационную базу.

#### `unblock` - Разблокировка базы
Разблокирует информационную базу.

### 📊 Команды для работы с обработками

#### `make-data-processors` - Создание обработок
Создает новые внешние обработки.

#### `update-data-processors` - Обновление обработок
Обновляет существующие обработки.

#### `update-data-processors-from-folder` - Обновление из папки
Обновляет обработки из указанной папки.

#### `compile-data-processors` - Компиляция обработок
Компилирует обработки.

#### `new-data-processors` - Новые обработки
Создает новые обработки с шаблонами.

#### `update-db-data-processors` - Обновление обработок в БД
Обновляет обработки в базе данных.

### 🗄 Команды для работы с базой данных

#### `update-db` - Обновление базы
Обновляет конфигурацию базы данных из файлов.

#### `moving-test-catalog` - Перемещение тестового каталога
Перемещает тестовые данные.

### 🧪 Тестовые команды

#### `scorpion` - Специальная команда
Проверка работоспособности приложения

## ⚙️ Конфигурация

### Переменные окружения
Для безопасности рекомендуется использовать переменные окружения для хранения паролей и токенов:
//TODO

## 📁 Структура проекта

Структура будет меняться
```
pivo-cli/
├── main.os                 # Главный файл приложения
├── main.bat               # Batch-файл для запуска
├── README.md              # Документация
├── ФайлНастроек.xml       # Настройки слияния конфигураций
├── packagedef             # Описание пакета
├── src/
│   ├── Классы/           # Классы команд
│   │   ├── КомандаCommit.os
│   │   ├── КомандаBranch.os
│   │   ├── КомандаInit.os
│   │   └── ...
│   └── Модули/           # Вспомогательные модули
│       ├── ОбщегоНазначения.os
│       ├── РаботаСJSON.os
│       └── ...
```

## 🔧 Модули

### Основные модули
- **ОбщегоНазначения.os** - Общие функции
- **РаботаСJSON.os** - Работа с JSON-данными
- **РаботаСМодулями.os** - Работа с модулями конфигурации
- **ПубликацияОбработокВБазе.os** - Публикация обработок
- **ВариантИзмененийФайловGit.os** - Отслеживание изменений в Git
- **файловыеОперации.os** - Файловые операции

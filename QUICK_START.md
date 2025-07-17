# 🚀 Быстрый старт - PIVO CLI

Этот документ поможет вам быстро начать работу с PIVO CLI приложением.

## 📋 Предварительные требования

1. **OneScript** - установите с [официального сайта](https://oscript.io/)
2. **1С:Предприятие** версии 8.3.11 или выше
3. **Git** - для работы с репозиториями
4. **Доступ к кластеру 1С** и базе данных

## ⚡ Быстрая настройка

### 1. Клонирование и установка

```bash
# Клонируйте репозиторий
git clone <repository-url>
cd devops

# Проверьте установку OneScript
oscript --version
```

### 2. Настройка переменных окружения

Создайте файл `.env` в корне проекта (для Windows используйте `set` команды):

```bash
# .env файл
USR_LOGIN_1C=admin
USR_PSWD_1C=your_password
USR_LOGIN_DB=sa
USR_PSWD_DB=your_db_password
GITLAB_TOKEN=your_gitlab_token
```

### 3. Первоначальная настройка проекта

```bash
# Инициализируйте репозиторий
oscript main.os init \
  --PathRepository="C:\Projects\MyProject" \
  --PathRemoteRepository="https://gitlab.com/company/myproject.git" \
  --UserName="Your Name" \
  --UserEmail="your.email@company.com"
```

## 🎯 Основные сценарии использования

### Сценарий 1: Создание новой ветки для разработки

```bash
oscript main.os Branch \
  --PathRepository="C:\Projects\MyProject" \
  --NewBranch="feature/new-processing" \
  --NameDB="MyDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="password" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --NamesDataProcessors="MyProcessing1,MyProcessing2" \
  --Extensions="Aelita,ToolsWorld" \
  --LoadDB="true" \
  --MethodLoadDB="ibcmd"
```

### Сценарий 2: Создание коммита с изменениями

```bash
oscript main.os commit \
  --PathRepository="C:\Projects\MyProject" \
  --NameDB="MyDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="password" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --Extensions="Aelita,ToolsWorld" \
  --TextCommit="Добавлена новая обработка" \
  --UrlRemoteRepository="https://gitlab.com/company/myproject.git" \
  --TokenConnectionGitLab="your-token" \
  --IdProject="123" \
  --MethodLoadDB="ibcmd" \
  --LoadDB="true" \
  --CommitAuthor="Developer"
```

### Сценарий 3: Создание merge request

```bash
oscript main.os create-merge-request \
  --PathRepository="C:\Projects\MyProject" \
  --TextCommit="Merge request для новой функциональности" \
  --UrlRemoteRepository="https://gitlab.com/company/myproject.git" \
  --TokenConnectionGitLab="your-token" \
  --IdProject="123"
```

## 🔧 Полезные команды

### Проверка статуса
```bash
# Проверить доступные команды
oscript main.os --help

# Проверить параметры конкретной команды
oscript main.os commit --help
```

### Работа с обработками
```bash
# Компиляция обработок
oscript main.os compile-data-processors \
  --PathRepository="C:\Projects\MyProject" \
  --NamesDataProcessors="MyProcessing1,MyProcessing2"

# Обновление обработок в базе
oscript main.os update-db-data-processors \
  --PathRepository="C:\Projects\MyProject" \
  --NamesDataProcessors="MyProcessing1,MyProcessing2"
```

### Управление базой данных
```bash
# Блокировка базы
oscript main.os block \
  --NameDB="MyDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password"

# Разблокировка базы
oscript main.os unblock \
  --NameDB="MyDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password"
```

## 📝 Шаблоны конфигурации

### Типичные параметры для разных СУБД

#### SQL Server
```bash
--TypeDB="MSSQLServer" \
--ServerDB="localhost" \
--UsrLoginDB="sa" \
--UsrPswdDB="password" \
--PathServerDB="localhost"
```

#### PostgreSQL
```bash
--TypeDB="PostgreSQL" \
--ServerDB="localhost" \
--UsrLoginDB="postgres" \
--UsrPswdDB="password" \
--PathServerDB="localhost"
```

### Типичные расширения
```bash
--Extensions="Aelita,ToolsWorld"
```

## 🚨 Частые ошибки и решения

### Ошибка: "Не удается подключиться к серверу 1С"
**Решение:** Проверьте, что сервер 1С запущен и доступен по указанному адресу.

### Ошибка: "Ошибка аутентификации в базе данных"
**Решение:** Проверьте правильность логина и пароля для СУБД.

### Ошибка: "Репозиторий не инициализирован"
**Решение:** Выполните команду `init` для инициализации репозитория.

### Ошибка: "Не удается заблокировать базу"
**Решение:** Убедитесь, что у пользователя есть права на блокировку базы.

## 📞 Получение помощи

1. **Документация**: Изучите полный README.md
2. **Логи**: Обратите внимание на сообщения с временными метками
3. **Тестирование**: Используйте команду `test` для проверки окружения
4. **Поддержка**: Создайте issue в репозитории проекта

## 🎉 Поздравляем!

Теперь вы готовы использовать DevOps CLI для автоматизации процессов разработки 1С. Начните с простых операций и постепенно осваивайте более сложные сценарии.

---

**Следующие шаги:**
- Изучите полную документацию в README.md
- Настройте CI/CD пайплайны
- Автоматизируйте процессы деплоя
- Настройте мониторинг и логирование 
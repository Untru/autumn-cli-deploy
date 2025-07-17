# 📋 Чек-лист развертывания DevOps CLI

Этот документ содержит пошаговый чек-лист для развертывания и настройки DevOps CLI в вашей среде.

## 🔧 Предварительная подготовка

### ✅ Системные требования

- [ ] **OneScript** версии 1.0 или выше установлен
- [ ] **1С:Предприятие** версии 8.3.11 или выше доступен
- [ ] **Git** установлен и настроен
- [ ] **Доступ к кластеру 1С** настроен
- [ ] **Доступ к базе данных** настроен
- [ ] **Интернет-соединение** для работы с GitLab

### ✅ Проверка установки OneScript

```bash
# Проверка версии OneScript
oscript --version

# Проверка доступности в PATH
where oscript  # Windows
which oscript  # Linux/Mac
```

### ✅ Проверка доступа к 1С

- [ ] Сервер 1С запущен и доступен
- [ ] Есть учетные данные администратора
- [ ] База данных доступна для подключения
- [ ] RAS сервер настроен (если используется)

## 🚀 Установка проекта

### ✅ Клонирование репозитория

```bash
# Клонирование проекта
git clone <repository-url>
cd devops

# Проверка структуры проекта
ls -la
```

### ✅ Проверка файлов проекта

- [ ] `main.os` - главный файл приложения
- [ ] `main.bat` - batch-файл для запуска
- [ ] `README.md` - документация
- [ ] `src/` - исходный код
- [ ] `ФайлНастроек.xml` - настройки слияния

### ✅ Тестовый запуск

```bash
# Проверка доступных команд
oscript main.os --help

# Проверка версии приложения
oscript main.os --version
```

## ⚙️ Настройка окружения

### ✅ Создание переменных окружения

#### Windows
```batch
set USR_LOGIN_1C=admin
set USR_PSWD_1C=your_password
set USR_LOGIN_DB=sa
set USR_PSWD_DB=your_db_password
set GITLAB_TOKEN=your_gitlab_token
```

#### Linux/Mac
```bash
export USR_LOGIN_1C=admin
export USR_PSWD_1C=your_password
export USR_LOGIN_DB=sa
export USR_PSWD_DB=your_db_password
export GITLAB_TOKEN=your_gitlab_token
```

### ✅ Создание файла .env (опционально)

```bash
# Создание файла .env
cat > .env << EOF
USR_LOGIN_1C=admin
USR_PSWD_1C=your_password
USR_LOGIN_DB=sa
USR_PSWD_DB=your_db_password
GITLAB_TOKEN=your_gitlab_token
EOF
```

### ✅ Настройка Git

```bash
# Проверка настроек Git
git config --global user.name
git config --global user.email

# Настройка Git (если не настроен)
git config --global user.name "Your Name"
git config --global user.email "your.email@company.com"
```

## 🔐 Настройка безопасности

### ✅ Проверка прав доступа

- [ ] Пользователь имеет права на блокировку базы
- [ ] Пользователь имеет права на компиляцию обработок
- [ ] Пользователь имеет права на работу с Git репозиторием
- [ ] Токен GitLab имеет необходимые права

### ✅ Настройка токена GitLab

- [ ] Создан персональный токен доступа
- [ ] Токен имеет права на чтение/запись в репозиторий
- [ ] Токен имеет права на создание merge request
- [ ] Токен сохранен в переменной окружения

### ✅ Проверка сетевого доступа

- [ ] Доступ к серверу 1С
- [ ] Доступ к серверу базы данных
- [ ] Доступ к GitLab
- [ ] Доступ к интернету (для загрузки зависимостей)

## 🧪 Тестирование

### ✅ Базовое тестирование

```bash
# Тест подключения к системе
oscript main.os test \
  --NameDB="TestDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password" \
  --PathServer1с="localhost"
```

### ✅ Тестирование инициализации

```bash
# Тест инициализации репозитория
oscript main.os init \
  --PathRepository="C:\Test\TestProject" \
  --PathRemoteRepository="https://gitlab.company.com/test/test-project.git" \
  --UserName="Test User" \
  --UserEmail="test@company.com"
```

### ✅ Тестирование блокировки базы

```bash
# Тест блокировки базы
oscript main.os block \
  --NameDB="TestDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password"

# Тест разблокировки базы
oscript main.os unblock \
  --NameDB="TestDatabase" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="password"
```

## 📁 Настройка проектов

### ✅ Создание структуры проектов

```bash
# Создание директорий для проектов
mkdir -p C:\Projects\WMS_Project
mkdir -p C:\Projects\ERP_Project
mkdir -p C:\Projects\TMS_Project
```

### ✅ Настройка конфигураций для разных проектов

#### WMS Project
```bash
# Инициализация WMS проекта
oscript main.os init \
  --PathRepository="C:\Projects\WMS_Project" \
  --PathRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --UserName="WMS Developer" \
  --UserEmail="wms@company.com"
```

#### ERP Project
```bash
# Инициализация ERP проекта
oscript main.os init \
  --PathRepository="C:\Projects\ERP_Project" \
  --PathRemoteRepository="https://gitlab.company.com/erp/erp-project.git" \
  --UserName="ERP Developer" \
  --UserEmail="erp@company.com"
```

## 🔄 Настройка автоматизации

### ✅ Создание скриптов автоматизации

#### Windows Batch скрипт
```batch
@echo off
REM daily-commit.bat
set REPO_PATH=C:\Projects\WMS_Project
set DB_NAME=WMS_Development

oscript main.os commit ^
  --PathRepository="%REPO_PATH%" ^
  --NameDB="%DB_NAME%" ^
  --UsrLogin1c="%USR_LOGIN_1C%" ^
  --UsrPswd1c="%USR_PSWD_1C%" ^
  --PathServer1с="localhost" ^
  --NumberPlatform="8.3.11.1234" ^
  --TypeDB="MSSQLServer" ^
  --ServerDB="localhost" ^
  --UsrLoginDB="%USR_LOGIN_DB%" ^
  --UsrPswdDB="%USR_PSWD_DB%" ^
  --PathServerDB="localhost" ^
  --RunRas="true" ^
  --Extensions="Aelita,ToolsWorld" ^
  --TextCommit="Ежедневный коммит %date% %time%" ^
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" ^
  --TokenConnectionGitLab="%GITLAB_TOKEN%" ^
  --IdProject="456" ^
  --MethodLoadDB="ibcmd" ^
  --LoadDB="true" ^
  --CommitAuthor="Automated Build"
```

#### PowerShell скрипт
```powershell
# create-branch.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$BranchName,
    
    [Parameter(Mandatory=$true)]
    [string]$DataProcessors
)

$RepoPath = "C:\Projects\WMS_Project"
$DbName = "WMS_Development"

& oscript main.os branche `
  --PathRepository="$RepoPath" `
  --NewBranche="$BranchName" `
  --NameDB="$DbName" `
  --UsrLogin1c="$env:USR_LOGIN_1C" `
  --UsrPswd1c="$env:USR_PSWD_1C" `
  --PathServer1с="localhost" `
  --NumberPlatform="8.3.11.1234" `
  --TypeDB="MSSQLServer" `
  --ServerDB="localhost" `
  --UsrLoginDB="$env:USR_LOGIN_DB" `
  --UsrPswdDB="$env:USR_PSWD_DB" `
  --PathServerDB="localhost" `
  --RunRas="true" `
  --NamesDataProcessors="$DataProcessors" `
  --Extensions="Aelita,ToolsWorld" `
  --LoadDB="true" `
  --MethodLoadDB="ibcmd"
```

### ✅ Настройка планировщика задач

#### Windows Task Scheduler
- [ ] Создана задача для ежедневного коммита
- [ ] Настроены переменные окружения для задачи
- [ ] Настроен триггер по расписанию
- [ ] Настроены права доступа для задачи

#### Linux Cron
```bash
# Добавление в crontab
0 18 * * * /path/to/daily-commit.sh
```

## 📊 Мониторинг и логирование

### ✅ Настройка логирования

```bash
# Создание директории для логов
mkdir -p logs

# Настройка перенаправления вывода
oscript main.os commit [параметры] 2>&1 | tee logs/commit_$(date +%Y%m%d_%H%M%S).log
```

### ✅ Создание скрипта мониторинга

```bash
#!/bin/bash
# monitor.sh

LOG_FILE="logs/application.log"
ERROR_LOG="logs/errors.log"

# Функция логирования
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Функция логирования ошибок
log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: $1" >> "$ERROR_LOG"
}

# Проверка доступности сервисов
check_services() {
    log_message "Checking services availability..."
    
    # Проверка 1С сервера
    if ! ping -c 1 localhost > /dev/null 2>&1; then
        log_error "1C server is not accessible"
        return 1
    fi
    
    # Проверка базы данных
    if ! ping -c 1 localhost > /dev/null 2>&1; then
        log_error "Database server is not accessible"
        return 1
    fi
    
    log_message "All services are accessible"
    return 0
}

# Основная логика
main() {
    log_message "Starting monitoring check"
    
    if check_services; then
        log_message "Monitoring check completed successfully"
    else
        log_error "Monitoring check failed"
        exit 1
    fi
}

main "$@"
```

## 🔍 Финальная проверка

### ✅ Полное тестирование рабочего процесса

1. **Создание ветки**
```bash
oscript main.os branche \
  --PathRepository="C:\Projects\WMS_Project" \
  --NewBranche="test-branch" \
  --NameDB="WMS_Development" \
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
  --NamesDataProcessors="TestProcessing" \
  --Extensions="Aelita,ToolsWorld" \
  --LoadDB="true" \
  --MethodLoadDB="ibcmd"
```

2. **Создание коммита**
```bash
oscript main.os commit \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
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
  --TextCommit="Тестовый коммит" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="your-token" \
  --IdProject="456" \
  --MethodLoadDB="ibcmd" \
  --LoadDB="true" \
  --CommitAuthor="Test User"
```

3. **Создание merge request**
```bash
oscript main.os create-merge-request \
  --PathRepository="C:\Projects\WMS_Project" \
  --TextCommit="Test merge request" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="your-token" \
  --IdProject="456"
```

### ✅ Проверка результатов

- [ ] Ветка создана успешно
- [ ] Коммит выполнен без ошибок
- [ ] Merge request создан в GitLab
- [ ] Логи содержат корректную информацию
- [ ] База данных заблокирована/разблокирована корректно

## 📚 Документация

### ✅ Создание пользовательской документации

- [ ] Создан README.md для команды
- [ ] Созданы инструкции для разработчиков
- [ ] Созданы примеры использования
- [ ] Документированы процедуры устранения неполадок

### ✅ Обучение команды

- [ ] Проведено обучение по использованию CLI
- [ ] Созданы обучающие материалы
- [ ] Настроена система поддержки
- [ ] Документированы лучшие практики

## 🎉 Завершение развертывания

### ✅ Финальная проверка

- [ ] Все тесты пройдены успешно
- [ ] Документация создана и доступна
- [ ] Команда обучена использованию
- [ ] Система мониторинга настроена
- [ ] Автоматизация настроена
- [ ] Резервные копии настроены

### ✅ Передача в эксплуатацию

- [ ] Система готова к использованию
- [ ] Поддержка настроена
- [ ] Контакты для поддержки определены
- [ ] Процедуры обновления документированы

---

**Поздравляем!** DevOps CLI успешно развернут и готов к использованию. 🚀

Для получения дополнительной помощи обратитесь к документации или создайте issue в репозитории проекта. 
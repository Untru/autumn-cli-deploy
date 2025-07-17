# 📚 Примеры использования DevOps CLI

Этот документ содержит практические примеры использования DevOps CLI для различных сценариев разработки.

## 🏗️ Сценарии разработки

### 1. Начальная настройка проекта

#### Инициализация нового проекта
```bash
# Создание нового репозитория
oscript main.os init \
  --PathRepository="C:\Projects\WMS_Project" \
  --PathRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --UserName="Иван Петров" \
  --UserEmail="ivan.petrov@company.com"
```

#### Первый коммит с базовой конфигурацией
```bash
oscript main.os commit \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --Extensions="Aelita,ToolsWorld" \
  --TextCommit="Инициализация проекта WMS" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="glpat-xxxxxxxxxxxxxxxxxxxx" \
  --IdProject="456" \
  --MethodLoadDB="ibcmd" \
  --LoadDB="true" \
  --CommitAuthor="Иван Петров"
```

### 2. Рабочий процесс разработчика

#### Создание ветки для новой функциональности
```bash
oscript main.os branche \
  --PathRepository="C:\Projects\WMS_Project" \
  --NewBranche="feature/warehouse-zones" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --NamesDataProcessors="ОбработкаЗоныСклада,ОтчетПоЗонам" \
  --Extensions="Aelita,ToolsWorld" \
  --LoadDB="true" \
  --MethodLoadDB="ibcmd"
```

#### Ежедневный коммит изменений
```bash
oscript main.os commit \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --Extensions="Aelita,ToolsWorld" \
  --TextCommit="Добавлена функциональность зон склада" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="glpat-xxxxxxxxxxxxxxxxxxxx" \
  --IdProject="456" \
  --MethodLoadDB="ibcmd" \
  --LoadDB="true" \
  --CommitAuthor="Иван Петров"
```

#### Создание merge request
```bash
oscript main.os create-merge-request \
  --PathRepository="C:\Projects\WMS_Project" \
  --TextCommit="Merge request: Функциональность зон склада" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="glpat-xxxxxxxxxxxxxxxxxxxx" \
  --IdProject="456"
```

### 3. Работа с обработками

#### Создание новой обработки
```bash
oscript main.os new-data-processors \
  --PathRepository="C:\Projects\WMS_Project" \
  --NamesDataProcessors="ОбработкаИнвентаризации"
```

#### Компиляция обработок
```bash
oscript main.os compile-data-processors \
  --PathRepository="C:\Projects\WMS_Project" \
  --NamesDataProcessors="ОбработкаИнвентаризации,ОтчетПоЗонам,ОбработкаЗоныСклада"
```

#### Обновление обработок в базе
```bash
oscript main.os update-db-data-processors \
  --PathRepository="C:\Projects\WMS_Project" \
  --NamesDataProcessors="ОбработкаИнвентаризации,ОтчетПоЗонам,ОбработкаЗоныСклада"
```

### 4. Управление ветками

#### Переход на ветку develop
```bash
oscript main.os branche-develop \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --LoadDB="true" \
  --MethodLoadDB="ibcmd"
```

#### Слияние в develop
```bash
oscript main.os branche-to-develop \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --LoadDB="true" \
  --MethodLoadDB="ibcmd"
```

## 🏭 Сценарии для разных проектов

### WMS (Управление складом)
```bash
# Типичная конфигурация для WMS
--NameDB="WMS_Production" \
--Extensions="Aelita,ToolsWorld" \
--NamesDataProcessors="ОбработкаПриемки,ОбработкаОтгрузки,ОбработкаИнвентаризации,ОтчетПоСкладу"
```

### ERP (Планирование ресурсов предприятия)
```bash
# Типичная конфигурация для ERP
--NameDB="ERP_Production" \
--Extensions="Aelita,ToolsWorld" \
--NamesDataProcessors="ОбработкаПланирования,ОбработкаБюджетирования,ОтчетПоПроизводству"
```

### TMS (Управление транспортом)
```bash
# Типичная конфигурация для TMS
--NameDB="TMS_Production" \
--Extensions="Aelita,ToolsWorld" \
--NamesDataProcessors="ОбработкаМаршрутов,ОбработкаДоставки,ОтчетПоТранспорту"
```

## 🔧 Конфигурации для разных СУБД

### SQL Server
```bash
--TypeDB="MSSQLServer" \
--ServerDB="sqlserver.company.com" \
--UsrLoginDB="wms_user" \
--UsrPswdDB="secure_password" \
--PathServerDB="sqlserver.company.com"
```

### PostgreSQL
```bash
--TypeDB="PostgreSQL" \
--ServerDB="postgres.company.com" \
--UsrLoginDB="wms_user" \
--UsrPswdDB="secure_password" \
--PathServerDB="postgres.company.com"
```

### Oracle
```bash
--TypeDB="OracleDatabase" \
--ServerDB="oracle.company.com" \
--UsrLoginDB="wms_user" \
--UsrPswdDB="secure_password" \
--PathServerDB="oracle.company.com"
```

## 🚀 Автоматизация с помощью скриптов

### Windows Batch скрипт для ежедневного коммита
```batch
@echo off
setlocal

set REPO_PATH=C:\Projects\WMS_Project
set DB_NAME=WMS_Development
set USER_LOGIN=admin
set USER_PSWD=admin123

echo Starting daily commit...

oscript main.os commit ^
  --PathRepository="%REPO_PATH%" ^
  --NameDB="%DB_NAME%" ^
  --UsrLogin1c="%USER_LOGIN%" ^
  --UsrPswd1c="%USER_PSWD%" ^
  --PathServer1с="localhost" ^
  --NumberPlatform="8.3.11.1234" ^
  --TypeDB="MSSQLServer" ^
  --ServerDB="localhost" ^
  --UsrLoginDB="sa" ^
  --UsrPswdDB="sa123" ^
  --PathServerDB="localhost" ^
  --RunRas="true" ^
  --Extensions="Aelita,ToolsWorld" ^
  --TextCommit="Ежедневный коммит %date% %time%" ^
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" ^
  --TokenConnectionGitLab="glpat-xxxxxxxxxxxxxxxxxxxx" ^
  --IdProject="456" ^
  --MethodLoadDB="ibcmd" ^
  --LoadDB="true" ^
  --CommitAuthor="Automated Build"

echo Daily commit completed.
pause
```

### PowerShell скрипт для создания ветки
```powershell
param(
    [Parameter(Mandatory=$true)]
    [string]$BranchName,
    
    [Parameter(Mandatory=$true)]
    [string]$DataProcessors
)

$RepoPath = "C:\Projects\WMS_Project"
$DbName = "WMS_Development"
$UserLogin = "admin"
$UserPswd = "admin123"

Write-Host "Creating branch: $BranchName" -ForegroundColor Green

& oscript main.os branche `
  --PathRepository="$RepoPath" `
  --NewBranche="$BranchName" `
  --NameDB="$DbName" `
  --UsrLogin1c="$UserLogin" `
  --UsrPswd1c="$UserPswd" `
  --PathServer1с="localhost" `
  --NumberPlatform="8.3.11.1234" `
  --TypeDB="MSSQLServer" `
  --ServerDB="localhost" `
  --UsrLoginDB="sa" `
  --UsrPswdDB="sa123" `
  --PathServerDB="localhost" `
  --RunRas="true" `
  --NamesDataProcessors="$DataProcessors" `
  --Extensions="Aelita,ToolsWorld" `
  --LoadDB="true" `
  --MethodLoadDB="ibcmd"

Write-Host "Branch created successfully!" -ForegroundColor Green
```

### Bash скрипт для Linux/Mac
```bash
#!/bin/bash

# Параметры
REPO_PATH="/home/user/projects/wms_project"
DB_NAME="WMS_Development"
USER_LOGIN="admin"
USER_PSWD="admin123"

# Функция для создания коммита
create_commit() {
    local commit_message="$1"
    
    oscript main.os commit \
        --PathRepository="$REPO_PATH" \
        --NameDB="$DB_NAME" \
        --UsrLogin1c="$USER_LOGIN" \
        --UsrPswd1c="$USER_PSWD" \
        --PathServer1с="localhost" \
        --NumberPlatform="8.3.11.1234" \
        --TypeDB="PostgreSQL" \
        --ServerDB="localhost" \
        --UsrLoginDB="postgres" \
        --UsrPswdDB="postgres123" \
        --PathServerDB="localhost" \
        --RunRas="true" \
        --Extensions="Aelita,ToolsWorld" \
        --TextCommit="$commit_message" \
        --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
        --TokenConnectionGitLab="$GITLAB_TOKEN" \
        --IdProject="456" \
        --MethodLoadDB="ibcmd" \
        --LoadDB="true" \
        --CommitAuthor="$(whoami)"
}

# Использование
if [ "$1" = "commit" ]; then
    create_commit "${2:-"Автоматический коммит $(date)"}"
elif [ "$1" = "branch" ]; then
    echo "Creating branch: $2"
    # Добавьте логику создания ветки
else
    echo "Usage: $0 {commit|branch} [message|branch_name]"
    exit 1
fi
```

## 🔍 Отладка и мониторинг

### Проверка статуса системы
```bash
# Тестирование подключения
oscript main.os test \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost"
```

### Логирование операций
```bash
# Создание коммита с подробным логированием
oscript main.os commit \
  --PathRepository="C:\Projects\WMS_Project" \
  --NameDB="WMS_Development" \
  --UsrLogin1c="admin" \
  --UsrPswd1c="admin123" \
  --PathServer1с="localhost" \
  --NumberPlatform="8.3.11.1234" \
  --TypeDB="MSSQLServer" \
  --ServerDB="localhost" \
  --UsrLoginDB="sa" \
  --UsrPswdDB="sa123" \
  --PathServerDB="localhost" \
  --RunRas="true" \
  --Extensions="Aelita,ToolsWorld" \
  --TextCommit="Тестовый коммит с логированием" \
  --UrlRemoteRepository="https://gitlab.company.com/wms/wms-project.git" \
  --TokenConnectionGitLab="glpat-xxxxxxxxxxxxxxxxxxxx" \
  --IdProject="456" \
  --MethodLoadDB="ibcmd" \
  --LoadDB="true" \
  --CommitAuthor="Developer" \
  2>&1 | tee commit_log.txt
```

## 📊 Мониторинг производительности

### Измерение времени выполнения
```bash
# Windows
@echo off
set start_time=%time%
oscript main.os commit [параметры]
set end_time=%time%
echo Start: %start_time%
echo End: %end_time%
```

```bash
# Linux/Mac
start_time=$(date +%s)
oscript main.os commit [параметры]
end_time=$(date +%s)
echo "Execution time: $((end_time - start_time)) seconds"
```

---

Эти примеры помогут вам быстро начать работу с DevOps CLI и автоматизировать процессы разработки 1С. Адаптируйте их под ваши конкретные потребности и инфраструктуру. 
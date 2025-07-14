
# Путь к файлу, в который будем добавлять строку
FILE_PATH="./filechange.txt"

# Строка, которую нужно добавить
NEW_LINE="This is a new line added after merge!"

# Добавляем строку в конец файла
echo "$NEW_LINE" >> "$FILE_PATH"

# Настроим git для коммита изменений
git config --global user.email "p.chegodaev@instument.com"
git config --global user.name "p.chegodaev"

# Добавляем изменения в git
git add "$FILE_PATH"

# Коммитим изменения
git commit -m "Added new line to $FILE_PATH"

# Отправляем изменения в репозиторий
git push origin main 
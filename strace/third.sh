#!/bin/bash

# Определяем пути к файлам логов
ERROR_LOG="/var/log/myapperror"
OUT_LOG="/var/log/myappout"

# Удаляем файлы логов, если они существуют
[ -e "$ERROR_LOG" ] && rm "$ERROR_LOG"
[ -e "$OUT_LOG" ] && rm "$OUT_LOG"

# Создаем пустые файлы логов
touch "$ERROR_LOG"
touch "$OUT_LOG"

# Запуск программы goapp3 в фоне с перенаправлением stderr и stdout
./goapp3 > "$OUT_LOG" 2> "$ERROR_LOG" &

# Получение PID запущенного процесса
PID=$!

# Вывод PID в формате "Your PID is: "
echo "Your PID is: $PID"


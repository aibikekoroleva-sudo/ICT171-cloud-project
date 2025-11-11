# Скрипт проверяет доступность сайта по HTTPS и пишет лог
# URL 
URL="https://aibikeproject.one"

# Текущая дата и время
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Получаем HTTP-код ответа сайта
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" $URL)

# Записываем результат в лог-файл
LOG_FILE=~/ICT171-cloud-project/server/scripts/health.log
echo "$TIMESTAMP - $URL - $HTTP_CODE" >> $LOG_FILE

# Проверяем, доступен ли сайт (код 200)
if [ "$HTTP_CODE" -ne 200 ]; then
  # Если сайт недоступен — отправляем e-mail
  echo "$TIMESTAMP - ALERT - $URL returned $HTTP_CODE" | mail -s "Site down" you@example.com
fi


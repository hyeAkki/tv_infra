#!/bin/sh

sleep 5

/usr/sbin/php-fpm7 -D

status=$?
if [ $status -ne 0 ]; then
  echo "php-fpm7 Failed: $status"
  exit $status
  else echo "Starting PHP-FPM: OK" > status1.txt
fi

while /bin/true; do
  ps aux | grep 'php-fpm: master process' | grep -q -v grep
  PHP_FPM_STATUS=$?
  echo "Checking PHP-FPM, Status Code: $PHP_FPM_STATUS" > status2.txt
  sleep 2

  if [ $PHP_FPM_STATUS -ne 0 ];
    then
      echo "$(date +%F_%T) FATAL: PHP-FPM Raised a Status Code of $PHP_FPM_STATUS and exited" > status3.txt
      exit -1

   else
     sleep 2
        echo "$(date +%F_%T) - HealtCheck: PHP-FPM: OK" > status4.txt
  fi
  sleep 2
done

# Defined in - @ line 1
function artserve --wraps='sudo php artisan serve --host 0.0.0.0 --port 80' --description 'alias artserve=sudo php artisan serve --host 0.0.0.0 --port 80'
  sudo php artisan serve --host 0.0.0.0 --port 80 $argv;
end

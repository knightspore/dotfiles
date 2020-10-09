# Defined in - @ line 1
function servers --wraps='sudo netstat -plnt' --description 'alias servers=sudo netstat -plnt'
  sudo netstat -plnt $argv;
end

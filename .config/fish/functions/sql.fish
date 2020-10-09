# Defined in - @ line 1
function sql --wraps='sudo /opt/lampp/lampp startmysql' --description 'alias sql=sudo /opt/lampp/lampp startmysql'
  sudo /opt/lampp/lampp startmysql $argv;
end

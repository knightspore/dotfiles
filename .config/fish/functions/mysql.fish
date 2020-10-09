# Defined in - @ line 1
function mysql --wraps='sudo /opt/lampp/lampp startmysql' --description 'alias mysql=sudo /opt/lampp/lampp startmysql'
  sudo /opt/lampp/lampp startmysql $argv;
end

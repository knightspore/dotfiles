# Defined in - @ line 1
function rf --wraps='sudo rm -rf' --description 'alias rf=sudo rm -rf'
  sudo rm -rf $argv;
end

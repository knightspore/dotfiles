# Defined in - @ line 1
function rf --wraps='sudo rm -rf' --wraps='rm -rf' --description 'alias rf=rm -rf'
  rm -rf $argv;
end

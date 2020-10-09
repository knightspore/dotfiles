# Defined in - @ line 1
function del --wraps='rm -r' --description 'alias del=rm -r'
  rm -r $argv;
end

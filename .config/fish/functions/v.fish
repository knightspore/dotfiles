# Defined in - @ line 1
function v --wraps='xclip -o' --description 'alias v=xclip -o'
  xclip -o $argv;
end

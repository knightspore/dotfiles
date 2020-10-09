# Defined in - @ line 1
function l --wraps='clear && ls -a' --description 'alias l=clear && ls -a'
  clear && ls -a $argv;
end

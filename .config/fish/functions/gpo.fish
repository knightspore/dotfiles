# Defined in - @ line 1
function gpo --wraps='git push origin' --description 'alias gpo=git push origin'
  git push origin $argv;
end

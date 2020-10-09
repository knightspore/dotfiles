# Defined in - @ line 1
function gpm --wraps='git push origin master' --description 'alias gpm=git push origin master'
  git push origin master $argv;
end

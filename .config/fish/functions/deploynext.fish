# Defined via `source`
function deploynext --wraps='git push;' --wraps='git push' --description 'alias deploynext=git push'
  git push $argv; 
end

function glp --wraps='git log --pretty=oneline' --description 'alias glp=git log --pretty=oneline'
  git log --pretty=oneline $argv; 
end

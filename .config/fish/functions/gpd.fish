# Defined in - @ line 1
function gpd --wraps='git push origin development' --description 'alias gpd=git push origin development'
  git push origin development $argv;
end

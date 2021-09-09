# Defined via `source`
function updatelocal --wraps='git checkout main; git pull origin main; git checkout stage-site; git merge main stage-site' --wraps='git pull' --description 'alias updatelocal=git pull'
  git pull $argv; 
end

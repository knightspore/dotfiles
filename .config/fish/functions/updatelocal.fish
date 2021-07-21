# Defined via `source`
function updatelocal --wraps='git checkout main; git pull origin main; git checkout stage-site; git merge main stage-site' --description 'alias updatelocal=git checkout main; git pull origin main; git checkout stage-site; git merge main stage-site'
  git checkout main; git pull origin main; git checkout stage-site; git merge main stage-site $argv; 
end

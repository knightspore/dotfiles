# Defined via `source`
function deploychanges --wraps='git push; git checkout master; git merge stage-site master; git push; git checkout stage-site;' --wraps='git push; git checkout master; git merge stage-site master; git push; git checkout stage-site' --description 'alias deploychanges=git push; git checkout master; git merge stage-site master; git push; git checkout stage-site'
  git push; git checkout master; git merge stage-site master; git push; git checkout stage-site $argv; 
end

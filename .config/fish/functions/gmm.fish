# Defined in - @ line 1
function gmm --wraps='gpd && git checkout master && git merge development && git checkout development' --wraps='gpd && git checkout master && git merge development && gpm && git checkout development' --description 'alias gmm=gpd && git checkout master && git merge development && gpm && git checkout development'
  gpd && git checkout master && git merge development && gpm && git checkout development $argv;
end

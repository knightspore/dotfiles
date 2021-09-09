# Defined via `source`
function devenv --wraps='tmuxp load .tmuxp/dev.yaml' --wraps='tmuxp load .tmuxp/dev.yaml --yes' --description 'alias devenv=tmuxp load .tmuxp/dev.yaml --yes'
  tmuxp load .tmuxp/dev.yaml --yes $argv; 
end

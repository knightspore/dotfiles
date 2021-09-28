function tment --wraps='tmuxp load ~/.tmuxp/entertain.yaml' --wraps=echo\ \'y\'\ \|\ tmuxp\ load\ \~/.tmuxp/entertain.yaml --description alias\ tment=echo\ \'y\'\ \|\ tmuxp\ load\ \~/.tmuxp/entertain.yaml
  echo 'y' | tmuxp load ~/.tmuxp/entertain.yaml $argv; 
end

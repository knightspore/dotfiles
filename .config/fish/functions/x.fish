# Defined in - @ line 1
function x --wraps=exit --wraps='tmux -detach' --wraps='tmux detach' --description 'alias x=tmux detach'
  tmux detach $argv;
end

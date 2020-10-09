# Defined in - @ line 1
function todo --wraps='cd ~/Documents; grep = todo.txt' --wraps='clear ; cd ~/Documents; grep = todo.txt' --description 'alias todo=clear; cd ~/Documents; grep = todo.txt'
  clear ; cd ~/Documents; grep = todo.txt $argv;
end

# Defined in - @ line 1
function todo --wraps='cat ~/Documents/Journal.md | grep ]' --wraps='cat ~/Documents/Journal.md | grep ] -' --wraps=cat\ \~/Documents/Journal.md\ \|\ grep\ \'\]\ -\' --description alias\ todo=cat\ \~/Documents/Journal.md\ \|\ grep\ \'\]\ -\'
  cat ~/Documents/Journal.md | grep '] -' $argv;
end

function gpr --wraps='gh pr create --label="automerge" --title=' --wraps='gh pr create --label="automerge" --title' --description 'alias gpr=gh pr create --label="automerge" --title'
  gh pr create --label="automerge" --title $argv; 
end

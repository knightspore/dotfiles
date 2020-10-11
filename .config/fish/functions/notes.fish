# Defined in - @ line 1
function notes --wraps='vi ~/Documents/Journal.md' --description 'alias notes=vi ~/Documents/Journal.md'
  vi ~/Documents/Journal.md $argv;
end

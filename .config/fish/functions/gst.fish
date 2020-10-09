# Defined in - @ line 1
function gst --wraps='git status' --description 'alias gst=git status'
  git status $argv;
end

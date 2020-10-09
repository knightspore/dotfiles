# Defined in - @ line 1
function cl --wraps='git clone' --description 'alias cl=git clone'
  git clone $argv;
end

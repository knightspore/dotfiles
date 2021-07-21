# Defined via `source`
function gem --wraps='gitmoji -c' --description 'alias gem=gitmoji -c'
  gitmoji -c $argv; 
end

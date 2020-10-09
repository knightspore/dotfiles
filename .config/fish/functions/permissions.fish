# Defined in - @ line 1
function permissions --wraps='chmod -R a+rwX' --description 'alias permissions=chmod -R a+rwX'
  chmod -R a+rwX $argv;
end

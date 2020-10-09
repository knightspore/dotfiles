# Defined in - @ line 1
function netlify-build-ciaran --wraps='curl -X POST -d {} https://api.netlify.com/build_hooks/5f4fde65852ab01def2e9576' --description 'alias netlify-build-ciaran=curl -X POST -d {} https://api.netlify.com/build_hooks/5f4fde65852ab01def2e9576'
  curl -X POST -d {} https://api.netlify.com/build_hooks/5f4fde65852ab01def2e9576 $argv;
end

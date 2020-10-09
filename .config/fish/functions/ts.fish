# Defined in - @ line 1
function ts --wraps='tsc ; node index.js' --wraps='tsc index.ts; node index.js' --description 'alias ts=tsc index.ts; node index.js'
  tsc index.ts; node index.js $argv;
end

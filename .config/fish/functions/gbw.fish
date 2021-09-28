function gbw --wraps='GOOS=js GOARCH=wasm go build -o' --description 'alias gbw=GOOS=js GOARCH=wasm go build -o'
  GOOS=js GOARCH=wasm go build -o $argv; 
end

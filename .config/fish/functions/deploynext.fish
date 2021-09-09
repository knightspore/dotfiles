function deploynext --wraps='npx next lint && yarn test && git push' --description 'alias deploynext=npx next lint && yarn test && git push'
  npx next lint && yarn test && git push $argv; 
end

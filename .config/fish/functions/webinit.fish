# Defined in - @ line 1
function webinit --wraps='touch index.html && touch style.css && touch script.js' --wraps='cp ~/.fish/webdev.sh ./webdev.sh && bash webdev.sh' --description 'alias webinit=cp ~/.fish/webdev.sh ./webdev.sh && bash webdev.sh'
  cp ~/.fish/webdev.sh ./webdev.sh && bash webdev.sh $argv;
end

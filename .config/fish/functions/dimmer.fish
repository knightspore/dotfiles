# Defined in - @ line 1
function dimmer --wraps='xrandr --output eDP-1 --brightness .2' --description 'alias dimmer=xrandr --output eDP-1 --brightness .2'
  xrandr --output eDP-1 --brightness .2 $argv;
end

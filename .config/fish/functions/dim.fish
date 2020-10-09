# Defined in - @ line 1
function dim --wraps='xrandr --output eDP-1 --brightness .9' --wraps='xrandr --output eDP-1 --brightness .6' --description 'alias dim=xrandr --output eDP-1 --brightness .6'
  xrandr --output eDP-1 --brightness .6 $argv;
end

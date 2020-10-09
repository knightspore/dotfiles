# Defined in - @ line 1
function br --wraps='xrandr --output eDP-1 --brightness 1' --description 'alias br=xrandr --output eDP-1 --brightness 1'
  xrandr --output eDP-1 --brightness 1 $argv;
end

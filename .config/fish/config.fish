# Launch into TMUX
# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end
#

export PATH="$PATH:/opt/yarn-[version]/bin"

set -g theme_color_scheme dark
gulp --completion=fish | source
thefuck --alias | source

set -g fish_preprocessor __expand_range
bind \n (string join ';' $fish_preprocessor)'; commandline -f execute'
bind \r (string join ';' $fish_preprocessor)'; commandline -f execute'


function __expand_range -d 'expand {X..Y} in buffer with bash\'s brace expansion'
    set -l buf
    for line in (commandline)
        set buf $buf (expand_range $line)
    end
    commandline (string join \n $buf)
end

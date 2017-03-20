function expand_range -d 'expand {X..Y} in arguments with bash\'s brace expansion'
    set -l line "$argv"

    for brace in (string match -ar '\{-?\w+\.\.-?\w+\}' $line)
        set -l expanded (bash -c "echo $brace")

        if test $brace != $expanded
            set -l csv (string replace -a ' ' ',' $expanded)

            set line (string replace $brace "{$csv}" $line)
        end
    end

    echo $line
end

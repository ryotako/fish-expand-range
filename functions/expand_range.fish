function expand_range -d 'expand {X..Y} in arguments with bash\'s brace expansion'

    set -l match_params (
        string replace -ar '\\\\[\\\\\'"]' '  ' "$argv" \
        | string match -anr '\'[^\']*\'|"[^"]*"|\{-?\w+\.\.-?\w+(\.\.-?\w+)?\}'
    )


    if test (count $match_params) -lt 1
        echo "$argv"
    else
        set -l output $argv

        for pos_len in $match_params[-1..1]
            echo $pos_len | read -l pos len
            set -l matched (string sub -s $pos -l $len $output)

            if string match -q '{*}' $matched
                set -l head (string sub -l $pos $output)
                set -l body (string replace -a ' ' , (bash -c "echo $matched"))
                set -l tail (string sub -s (math "$pos+$len-1") $output)

                set output "$head$body$tail"
            end
        end

        echo $output
    end
end

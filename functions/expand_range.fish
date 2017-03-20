function expand_range -d 'expand {X..Y} in arguments with bash\'s brace expansion'
    set -l input "$argv"
    set -l buf $input
    set -l output $input 

    set -l buf (string replace -ar '\\\\[\\\\\'"]' '  ' $buf)

    for pos_len in (string match -anr '\'[^\']*\'|"[^"]*"|\{-?\w+\.\.-?\w+(\.\.-?\w+)?\}' $buf)
        echo $pos_len | read -l pos len
        set -l matched (string sub -s $pos -l $len $input)

        if string match -q '{*}' $matched
            set -l head (string sub -l $pos $input)
            set -l body (string replace -a ' ' , (bash -c "echo $matched"))
            set -l tail (string sub -s (math "$pos+$len-1") $input)

            set output "$head$body$tail"
        end
    end

    echo $output
end

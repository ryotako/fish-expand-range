function __expand_range_and_execute -d 'expand {X..Y} in the buffer and execute it'
    __expand_range
    commandline -f execute
end

test '{1..3}'
    '{1,2,3}' = (expand_range '{1..3}')
end

test '{-1..-3}'
    '{-1,-2,-3}' = (expand_range '{-1..-3}')
end

test '{1..9..2}'
    '{1,3,5,7,9}' = (expand_range '{1..9..2}')
end

test '{a..c}'
    '{a,b,c}' = (expand_range '{a..c}')
end

test '{a..e..2}'
    '{a,c,e}' = (expand_range '{a..e..2}')
end

test 'echo {1..3};'
    'echo {1,2,3};' = (expand_range 'echo {1..3};')
end

test 'echo {a..c}{1..5..2}'
    'echo {a,b,c}{1,3,5}' = (expand_range 'echo {a..c}{1..5..2}')
end

test "'{1..3}'"
    "'{1..3}'" = (expand_range "'{1..3}'")
end

test '"{1..3}"'
    '"{1..3}"' = (expand_range '"{1..3}"')
end

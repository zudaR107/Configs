# Enhanced 'df': if a path is provided and exists, use 'duf' on that path,
# otherwise run 'duf' for all mounts. Requires 'duf' to be installed.
function df
    if test $argv
        set last_arg $argv[-1]
        if test -e "$last_arg"
            duf "$last_arg"
            return
        end
    end

    duf
end

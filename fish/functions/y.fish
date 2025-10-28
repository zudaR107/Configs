function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file "$tmp"

    set -l cwd ""
    if test -r "$tmp"
        set cwd (cat -- "$tmp")
    end

    if test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- "$cwd"
    else
        if type -q eza
            eza -1 --icons=auto
        else
            ls -la
        end
    end

    rm -f -- "$tmp"
end

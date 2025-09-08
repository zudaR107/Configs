# Override builtin 'cd' to list directory contents using 'eza'
# after changing into the target directory.
function cd
    builtin cd $argv
    eza -1 --icons=auto
end
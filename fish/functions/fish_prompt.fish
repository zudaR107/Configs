# Custom fish prompt:
# - shows user@host and pwd
# - colors differ for root
# - shows last command exit status on error
# - includes VCS segment (git status) via fish_vcs_prompt
function fish_prompt --description 'Write out the prompt'
        set -l last_status $status
        set -l normal (set_color normal)
        set -l status_color (set_color brgreen)
        set -l cwd_color (set_color $fish_color_cwd)
        set -l vcs_color (set_color brpurple)
        set -l prompt_status ""
    
        # Allow long directory names (no truncation)
        set -q fish_prompt_pwd_dir_length
        or set -lx fish_prompt_pwd_dir_length 0
    
        # Root prompt colors/suffix
        set -l suffix '❯'
        if functions -q fish_is_root_user; and fish_is_root_user
                if set -q fish_color_cwd_root
                        set cwd_color (set_color $fish_color_cwd_root)
                end
                set suffix '#'
        end
    
        # Show [exit_code] if previous command failed
        if test $last_status -ne 0
                set status_color (set_color $fish_color_error)
                set prompt_status $status_color "[" $last_status "]" $normal
        end
    
        echo -n -s (prompt_login) ' ' $cwd_color (prompt_pwd) $vcs_color (fish_vcs_prompt) $normal ' ' $prompt_status
        echo -n -s $status_color $suffix ' ' $normal
end

set -g fish_greeting

source ~/.config/fish/hyde_config.fish

if type -q starship
    starship init fish | source
    set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end


# fzf 
if type -q fzf
    fzf --fish | source 
end







# example integration with bat : <cltr+f>
# bind -M insert \ce '$EDITOR $(fzf --preview="bat --color=always --plain {}")' 


set fish_pager_color_prefix cyan
set fish_color_autosuggestion brblack 

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias vc='code'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# Abbrs
abbr p  'python'
abbr j  'JLinkExe -nogui 1 -commandfile'
abbr jf 'JLinkExe -nogui 1 -commandfile flash/flash.jlink'
abbr je 'JLinkExe -nogui 1 -commandfile flash/erase.jlink'
abbr of 'openocd -f flash/script.cfg -f flash/flash.ocd'
abbr oe 'openocd -f flash/script.cfg -f flash/erase.ocd'
abbr m  'make -j8'
abbr mc 'make clean'

hello

# Запуск ssh-agent, если его ещё нет
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end

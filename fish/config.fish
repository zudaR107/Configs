# Disable default fish greeting
set -g fish_greeting

# Source HyDE environment and XDG defaults
source ~/.config/fish/hyde_config.fish

# Initialize Starship prompt if available.
# Use XDG-compliant cache/config paths.
if type -q starship
    starship init fish | source
    set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end

# fzf integration: enable fish keybindings and widgets if present
if type -q fzf
    fzf --fish | source 
end

# Example: open editor on Ctrl+E with a bat preview (uncomment to enable)
# bind -M insert \ce '$EDITOR $(fzf --preview="bat --color=always --plain {}")'

# Pager and colors
set fish_pager_color_prefix cyan
set fish_color_autosuggestion brblack 

# Ensure GPG pinentry works in the current terminal (required for signing commits, etc.)
set -gx GPG_TTY (tty)

# --- Aliases / Abbreviations ---

# Directory listings (using eza). Requires eza to be installed.
alias l='eza -lh  --icons=auto'                               # long list
alias ls='eza -1   --icons=auto'                              # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto'                              # list dirs
alias lt='eza --icons=auto --tree'                            # tree view
alias vc='code'                                               # VS Code(OSS) shortcut

# Handy cd shortcuts (fish abbr expands before execution)
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# mkdir always creates parent directories
abbr mkdir 'mkdir -p'

# Tooling shortcuts
abbr p  'python'
abbr j  'JLinkExe -nogui 1 -commandfile'
abbr jf 'JLinkExe -nogui 1 -commandfile flash/flash.jlink'
abbr je 'JLinkExe -nogui 1 -commandfile flash/erase.jlink'
abbr of 'openocd -f flash/script.cfg -f flash/flash.ocd'
abbr oe 'openocd -f flash/script.cfg -f flash/erase.ocd'
abbr m  'make -j8'
abbr mc 'make clean'

# Run welcome function that prints Fastfetch on shell start
# (see functions/hello.fish)
hello

# Start ssh-agent if not running and export its socket
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end
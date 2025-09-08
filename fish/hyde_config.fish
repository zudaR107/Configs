#!/usr/bin/env fish
# HyDE's fish env configuration
# Sets XDG base directories and other sane defaults for tools.

# Ensure XDG variables are present (prefer user-local paths)
if test -z "$XDG_CONFIG_HOME"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end
if test -z "$XDG_DATA_HOME"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
end
if test -z "$XDG_DATA_DIRS"
    set -gx XDG_DATA_DIRS "$XDG_DATA_HOME:/usr/local/share:/usr/share"
end
if test -z "$XDG_STATE_HOME"
    set -gx XDG_STATE_HOME "$HOME/.local/state"
end
if test -z "$XDG_CACHE_HOME"
    set -gx XDG_CACHE_HOME "$HOME/.cache"
end

# Default XDG user directories (only if unset)
if test -z "$XDG_DESKTOP_DIR"
    set -gx XDG_DESKTOP_DIR "$HOME/Desktop"
end
if test -z "$XDG_DOWNLOAD_DIR"
    set -gx XDG_DOWNLOAD_DIR "$HOME/Downloads"
end
if test -z "$XDG_TEMPLATES_DIR"
    set -gx XDG_TEMPLATES_DIR "$HOME/Templates"
end
if test -z "$XDG_PUBLICSHARE_DIR"
    set -gx XDG_PUBLICSHARE_DIR "$HOME/Public"
end
if test -z "$XDG_DOCUMENTS_DIR"
    set -gx XDG_DOCUMENTS_DIR "$HOME/Documents"
end
if test -z "$XDG_MUSIC_DIR"
    set -gx XDG_MUSIC_DIR "$HOME/Music"
end
if test -z "$XDG_PICTURES_DIR"
    set -gx XDG_PICTURES_DIR "$HOME/Pictures"
end
if test -z "$XDG_VIDEOS_DIR"
    set -gx XDG_VIDEOS_DIR "$HOME/Videos"
end

# Avoid persistent less history (keep it ephemeral)
if test -z "$LESSHISTFILE"
    set -gx LESSHISTFILE "/tmp/less-hist"
end

# GNU parallel home under XDG
if test -z "$PARALLEL_HOME"
    set -gx PARALLEL_HOME "$XDG_CONFIG_HOME/parallel"
end

#Important
xset r rate 300 25 #responsive keys
#xset r rate 100 1 #responsive keys
set -o vi
set bell-style visual

#Exports
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export DOT="$HOME/dotfiles"
export NVIMRC="$DOT/nvim/"
export PATH="$PATH:$HOME/.local/share/go/bin/"
export SDL_VIDEODRIVER=wayland

# Alias
source $DOT/bash/bash_alias


# Node Version Manager exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export IRS_CONFIG_LOCATION='$HOME/Apps/irs/bin/config.yml'

#FZF
if [[ ! "$PATH" == */home/illumiko/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/illumiko/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/illumiko/$DOT/bash/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$DOT/bash/key-bindings.bash"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border=bold'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"


# {{{ STUFF IDK WHAT IT DOES BUT I KEPT IT SO NOTHING BREAKS
#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


# alias ls='ls --color=auto'
# alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
# alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}
# }}}

# Caps as backspacpe
setxkbmap -option caps:backspace
xmodmap -e "keycode 66 = BackSpace"
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']" 
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
eval "$(starship init bash)" #starship prompt

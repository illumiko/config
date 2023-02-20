#Important
eval "$(starship init bash)" #starship prompt
xset r rate 200 50 #responsive keys
set -o vi
set bell-style visual

# Alias
alias PJC="cd ~/Documents/Projects/Course/" #dir shortcut 
alias PJP="cd ~/Documents/Projects/Personal/" #dir shortcut 
alias PJT="cd ~/Documents/Projects/Testing/" #dir shortcut 
alias nvrc='nvim ~/.config/nvim/init.lua' #open nvimrc
alias python='python3.8' #open nvimrc
alias poweroff='systemctl poweroff' #turning off pc 
alias anime='~/Apps/ani-cli/ani-cli' #anime cli
alias se='du -a ~/.config/* ~/Documents/Projects/* | awk "{print $2}" | fzf | xargs -r $EDITOR ; '
alias todo='nvim ~/Documents/neorg/gtd/index.norg'
alias jspg='nvim ~/Documents/Projects/Testing/webDev/playground/app.js'
alias pypg='nvim ~/Documents/Projects/Testing/python/PPG/playground.py'
alias gopg="nvim ~/Documents/Projects/Testing/go/playground/pg.go"
alias shpg='nvim ~/Documents/Projects/Testing/bashScript/playground/playground.sh'
alias luapg='nvim ~/Documents/Projects/Testing/lua/playground/playground.lua'
alias tmux='tmux -f ~/.config/tmux/.tmux.conf -u'
alias journal="nvim ~/Documents/norg/index.norg"
alias yt-dlp='yt-dlp --config-locations "$DOT/yt-dlp.conf"'
alias nl='redshift -o -l 0:0 -t 5000:5000'
alias nx='redshift -x'
alias pomodoro="go run ~/Documents/Projects/Personal/godoro/main.go"
alias nv="nvim"
alias em="emacs"


alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#Exports
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export DOT="$HOME/Dotfiles"
export PATH="$PATH:$HOME/.local/share/go/bin/"

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


alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

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
# setxkbmap -option caps:backspace
# xmodmap -e "keycode 66 = BackSpace"
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']" 

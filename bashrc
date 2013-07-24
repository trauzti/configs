# If not running interactively, don't do anything
[ -z "$PS1" ] && return
. /usr/etc/profile.d/autojump.zsh
#export PATH=$PATH:/opt/android/eclipse/:/opt/android/sdk/tools:/opt/android/sdk/platform-tools
export PATH=$PATH:/home/trauzti/TriggerToolkit

# Aliases and functions
alias drop="dropbox stop && dropbox start"
alias vimbash="vim ~/.bashrc"
alias vimzsh="vim ~/.zshrc"
alias vimi3="vim ~/.i3/config"
alias vimrc="vim ~/.vimrc"
alias u=pushd
alias o=popd
alias mk=make
alias l="ls"
alias ls="ls --color=auto"
alias ll="ls --color=auto -l"
alias grep='grep --color=auto'
alias plass="sudo du -hc --max-depth=1"
function hs() { ghc --make -o $1 $1.hs && rm $1.hi $1.o && ./$1 ;}

# ctrl+a / ctrl+e
set -o emacs
# Forward search: ctrl+s (backward search: ctrl+r)
stty -ixon

#function p() { if $1g++ $1 -o $(sed $1 "s/\.cpp//g" ); }
function p() { make $(echo $1 | sed -e "s/\.cpp//g" -e "s/\.c//g"); }
alias play='mplayer -af scaletempo -ao sdl' # Eda profa -ao OSS
function wififix() { sudo modprobe -r iwlwifi; sudo modprobe iwlwifi; }
function soundfix() { sudo rmmod -f snd_hda_intel; sudo modprobe snd_hda_intel; }

alias vi="vim"
xset r rate 400 80
alias python="python2"
function pser () { aura -Ss $1; aura -As $1; } 

source ~/secretrc
source ~/configs/git-completion.bash
export RUBYOPT=rubygems

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source "$HOME/.rvm/scripts/rvm"

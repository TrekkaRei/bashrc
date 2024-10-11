# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
	export PS1="\[\e[1;31m\]\w \[\e[1;32m\]>\[\e[0m\] "
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alohFN --group-directories-first'
alias la='ls -sahCF --sort=extension'
export EDITOR=vim

# trekka custom aliases
~/Documents/bash/spec.sh

alias vimtheme="sudo vim /usr/share/vim/vim82/colors/trekka.vim"
alias kcpu=". /home/trekka/Documents/bash/highcpu.sh"
alias qs="ls -sahCF --sort=extension | grep -i $*"
alias btoptheme="sudo vim /usr/share/btop/themes/trekka.theme"
alias w1="watch -t -n 1 $*"
alias restartrgb="pkill openrgb; sleep 1; . /home/trekka/Documents/bash/restartRGB.sh & exit"
alias cal1="ncal -b"
alias hwosd=". ~/.hw-osd/Main.sh"
alias recdir="cd /home/trekka/Documents/recording"
alias reca1=". /home/trekka/Documents/bash/playrec.sh"
alias reca=". /home/trekka/Documents/bash/recordaudio.sh"
alias ytdir="cd ~/Music/yt-dl/"
alias podc=". /home/trekka/Documents/bash/podc.sh"
alias twt=". /home/trekka/Documents/bash/twt.sh"
alias ytdl="cd ~/Music/yt-dl; . /home/trekka/Documents/bash/ytd.sh"
alias rescale=". /home/trekka/Documents/bash/ffmpegscale.sh"
alias rec1=". /home/trekka/Documents/bash/record1mon.sh"
alias rec0=". /home/trekka/Documents/bash/record0mon.sh"
alias mpv1=". /home/trekka/Documents/bash/mpvrun.sh"
alias mocpstate="mocp --info | grep -i state | cut -c 8-12"
alias sym="cat /home/trekka/Documents/bash/symbols"
alias sgrep="grep --color=auto -isnT"
alias fetchconf="vim /home/trekka/.config/fastfetch/config.jsonc"
alias trekkacss="vim /home/trekka/.themes/Trekka/cinnamon/cinnamon.css"
alias fgg="jobs -l"
alias rungpe="watch -t -n 1 /home/trekka/Documents/bash/gpescript.sh"
alias githelp="cat /home/trekka/Documents/helpful/githelp"
alias mtag=". /home/trekka/Documents/bash/mtag.sh"
alias mocpw=". /home/trekka/Documents/bash/mocpwatch.sh"
alias gpefix="cat /home/trekka/Documents/gpe"
alias dls="cd ~/Downloads"
alias cputemp=". ~/Documents/bash/.cpu_temp.sh"
alias update="sudo nala update"
alias upgrade="sudo nala upgrade"
alias gpecheck="grep enabled /sys/firmware/acpi/interrupts/*"
alias gitdir=". /home/trekka/Documents/bash/gitdir.sh"
alias gitload=". /home/trekka/Documents/bash/gitload.sh"
alias c="cd .."
alias konsoleq="konsole --fullscreen --layout ~/.trekka-konsole-layout --tabs-from-file ~/.konsole/trekka"
alias mocp="mocp -O ShowFormat=no -O HideFileExtension=yes -O Repeat=yes -O Keymap=~/.moc/keymap -O PlaylistFullPaths=no -T /home/trekka/.moc/themes/trekka" 
alias compat="find ~/.steam/debian-installation/steamapps/compatdata -iname $*"
alias ryzen=". ~/Documents/bash/ryzenUV.sh"
alias mango="echo MANGOHUD=1 MANGOHUD_CONFIGFILE=/home/trekka/.config/MangoHud/general.conf %command%"
alias furry="celluloid '/mnt/sda2/Media/Videos/Anime/Wild Assault - Marquez.mp4'"
alias worked="vim /home/trekka/Documents/work/worked"
alias ggit="cd /home/trekka/Documents/git"
alias gittoken="echo ' ' && cat /home/trekka/Documents/.token"
alias clean="sudo apt autoremove && sudo apt-get autoclean"
alias xmod="xmodmap ~/.Xmodmap && xmodmap -e 'clear lock'"
alias foxcss="vim ~/.mozilla/firefox/eprwbjq2.default-release/chrome/userChrome.css"
alias pinger="tput civis && watch -x -b -t -n 0.5 ~/Documents/bash/latency.sh" 
alias cssedit="vim -O ~/.themes/Glitch/cinnamon/cinnamon.css /usr/share/cinnamon/theme/cinnamon.css"
alias cma="unimatrix -c blue -s 92 -o -i"
alias recon="bluetoothctl disconnect 88:08:94:10:D0:3C && sleep 2s && bluetoothctl connect 88:08:94:10:D0:3C"
alias cell="celluloid"
alias bashdir="cd ~/Documents/bash/"
alias vimclear="rm -fr ~/.vimrc.swp && rm -f ~/.vimrc.swo"
alias doc="cd ~/Documents"
alias home="cd ~ && clear && fastfetch --logo 'linux-mint_small' --logo-padding-top 2
"
alias his="history"
alias cls="clear && fastfetch --logo 'linux-mint_small' --logo-padding-top 2"
alias notepad="subl"
alias tweaks="vim /home/trekka/Documents/Helpful/tweaks"
alias spec="clear && fastfetch --logo 'linux-mint_small' --logo-padding-top 2
"
alias tasks="top -E g -e m -d 1 -o %CPU -i"
alias reload="source ~/.bashrc && clear && fastfetch --logo 'linux-mint_small' --logo-padding-top 2"
alias status="clear && df --type=ext4 -h && echo -e && free --giga -h && echo -e"
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"

# backup
alias backupvifm="cp -v ~/.config/vifm/vifmrc ~/Documents/Presets/vifm/  && cp -v ~/.config/vifm/colors/trekka.vifm ~/Documents/Presets/vifm/"
alias backupfirefox="cp -v ~/.mozilla/firefox/eprwbjq2.default-release/chrome/userChrome.css ~/Documents/Presets/firefox/"
alias backupbashrc="cp -v ~/.bashrc ~/Documents/Presets/"
alias backupvimrc="cp -v ~/.vimrc ~/Documents/Presets/"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


set TERM "xterm-256color"
set EDITOR "emacsclient -t"

alias kemacs="emacsclient -e '(kill-emacs)'"
alias gfxcard="lspci -nnk | grep -A2 VGA"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ff="firefox > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias discord="discord --no-sandbox > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias rss="newsboat"
alias yt="ytfzf"
alias shutdown="shutdown now"
alias fonts="fc-list"
alias phone="xclip -o | qrencode -t utf8"
alias fvwmconsole="FvwmCommand Module FvwmConsole -terminal xterm"
alias sshmount="sshfs root@imre.al:/var/www ~/imre.al"
alias mail="mailsync > /dev/null 2>&1 &> /dev/null 2>&1 & bash -c neomutt"
alias music="ncmpcpp -q"
alias sig="~/clone/scli/scli --save-history"
alias ls="exa --long --no-user --git"
alias exitwm="sudo systemctl restart ly.service"
alias serve="ng serve -o --host $(ip addr | awk 'BEGIN { FS="[[:blank:]/]+" } /inet/ { print $3 }' | sed -n '3 p')"
alias emacs="runemacs.sh"

function fish_greeting
end

function img
    feh -. "$argv" & disown
end

function export
    if [ $argv ]
        set var (echo $argv | cut -f1 -d=)
        set val (echo $argv | cut -f2 -d=)
        set -g -x $var $val
    else
        echo 'export var=value'
    end
end

function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

starship init fish | source

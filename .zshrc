export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
    copybuffer
    command-not-found
	zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.dotfiles/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dwm/dwmblocks/scripts:$PATH"
export PATH="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/clone/go_projects/"
export DISPLAY=:0
export TERM="wezterm"
# export EDITOR="emacsclient -t"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export BROWSER="librewolf"
export EDITOR="nvim"

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark

# preferred editor for local & remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# alias kemacs="emacsclient -e '(kill-emacs)'"
alias gfxcard="lspci -nnk | grep -A2 VGA"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ff="librewolf > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias discord="discord --no-sandbox > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias shutdown="shutdown now"
alias fonts="fc-list"
alias phone="xclip -o | qrencode -t utf8"
alias fvwmconsole="FvwmCommand Module FvwmConsole -terminal xterm"
alias sshmount="sshfs root@imre.al:/var/www ~/imre.al"
alias mail="mailsync > /dev/null 2>&1 &> /dev/null 2>&1 & bash -c neomutt"
alias music="ncmpcpp -q"
alias sig="~/clone/scli/scli --save-history"
alias ls="eza --long --no-user --git --icons"
alias exitwm="sudo systemctl restart ly.service"
alias serve="ng serve -o --host $(ip addr | awk 'BEGIN { FS="[[:blank:]/]+" } /inet/ { print $3 }' | sed -n '3 p')"
# alias emacs="runemacs.sh"
# alias cdb="cd $(emacsclient -e '(file-name-directory (buffer-file-name (window-buffer)))' | tr -d '\"')"
alias vim="nvim"
alias v="nvim"
alias cat="bat"
alias pdf="sioyek"

eval "$(starship init zsh)"

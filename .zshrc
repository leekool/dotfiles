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
export PATH="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug:$PATH"
export PATH="$HOME/clone/go_projects/bin:$PATH"
export DISPLAY=:0
export EDITOR="nvim"
export TERM="wezterm"
export BROWSER="librewolf"
export GOPATH="$HOME/clone/go_projects/"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark

alias img="feh --info \"echo %wx%h\""
alias vim="nvim"
alias v="nvim"
alias lg="lazygit"
alias cat="bat"
alias pdf="sioyek"
alias shutdown="shutdown now"
alias templs="templ generate --watch --proxy=\"http://localhost:8080\" --cmd=\"go run .\""
alias sd="shutdown now"
alias rb="reboot"
alias gfx="lspci -nnk | grep -A2 VGA"
# alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ff="librewolf > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias discord="discord --no-sandbox > /dev/null 2>&1 &> /dev/null 2>&1 & disown"
alias fonts="fc-list"
alias phone="xclip -o | qrencode -t utf8"
alias sshmount="sshfs root@imre.al:/var/www ~/imre.al"
alias mail="mailsync > /dev/null 2>&1 &> /dev/null 2>&1 & bash -c neomutt"
alias music="ncmpcpp -q"
alias ls="eza --long --no-user --git --icons"
alias cls="clear && eza --long --no-user --git --icons"
alias zbr="zig build run"
alias jz="~/clone/jetzig/cli/zig-out/bin/jetzig"
alias cdc="cd ~/clone"

eval "$(starship init zsh)"

# bun completions
[ -s "/home/lee/.bun/_bun" ] && source "/home/lee/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

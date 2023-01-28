# ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/dwm/dwmblocks/scripts:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.fvwm/scripts:$PATH"
export PATH="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug/:$PATH"
export PATH="$HOME/clone/signal-cli/build/install/signal-cli/bin/:$PATH"
export DISPLAY=:0
export EDITOR="emacsclient -t"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export BROWSER="firefox $1 >/dev/null 2>&1 & disown -a"
export CHROME_PATH="brave";

alias ls='ls --color=auto'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

if [ -d "$HOME/adb-fastboot/platform-tools" ]; then
    export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# load Angular CLI autocompletion
source <(ng completion script)

cht () {
    IFS=+
    curl cht.sh/"$*"
}

eval "$(starship init bash)"

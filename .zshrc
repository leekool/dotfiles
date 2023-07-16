# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
    copybuffer
    command-not-found
	zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/.dotfiles/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dwm/dwmblocks/scripts:$PATH"
export PATH="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug/:$PATH"
export DISPLAY=:0
# export EDITOR="emacsclient -t"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# export BROWSER="librewolf $1 >/dev/null 2>&1 & disown -a"
export BROWSER="librewolf"
export EDITOR="nvim"

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

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
alias ls="exa --long --no-user --git"
alias exitwm="sudo systemctl restart ly.service"
alias serve="ng serve -o --host $(ip addr | awk 'BEGIN { FS="[[:blank:]/]+" } /inet/ { print $3 }' | sed -n '3 p')"
# alias emacs="runemacs.sh"
# alias cdb="cd $(emacsclient -e '(file-name-directory (buffer-file-name (window-buffer)))' | tr -d '\"')"
alias vim="nvim"
alias v="nvim"
alias cat="bat"
alias pdf="sioyek"

eval "$(starship init zsh)"

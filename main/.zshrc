# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git)
plugins=(zsh-syntax-highlighting)
#plugins=(jump)
plugins=(
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Autostart Tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t Dev || tmux new -s Dev
fi

# default apps
export EDITOR="nvim"
export TERMINAL="alacritty"

# -- KEYBINDS --
# clear screen
bindkey "^L" clear-screen
# undo
bindkey "^z" undo
# kill-line
bindkey "^y" kill-line
# backward-kill-line
bindkey "^[y" backward-kill-line
# yank
bindkey "^[" yank
# down-case-word
bindkey "^u" down-case-word
# backward-delete-char
bindkey "^w" backward-delete-char
# backward-kill-word
bindkey "^[w" backward-kill-word
# search fzf 
bindkey -s '^[ ' 'fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -r nvim\n'
# search history  fzf
bindkey '^[h' history-fzf-execute

# -- ALIASES --
# root
alias root="sudo su -"
# source
alias refresh="source ~/.zshrc"
# update system + brew
alias update="sudo apt update && sudo apt upgrade; ~/.config/bin/brewx"
# sudo update & upgrade
alias supdate="sudo apt update && sudo apt upgrade"
# brew script
alias brewx="~/.config/bin/brewx"
# usb device
alias usb="cd /media/nathan/"
# vscode
alias vs="code"
# nord
alias nord="nordpass"
# bin
alias bin="cd ~/.local/bin/"
# nvim
alias vim="nvim"
# lazygit
alias lg="lazygit"
# config
alias config="cd ~/.config"
# state files
alias state="cd ~/.local/state/nvim/swap"
# home 
alias home="cd ~/"
# open
alias open="xdg-open"
# timeshift
alias timeshift="sudo timeshift-gtk"
# system fodler
alias sys="cd ~/System/"
# development folder
alias dev="cd ~/Dev/"
# project folder
alias projects="cd ~/Dev/Projects/"
# sandbox folder
alias sandbox="cd ~/Dev/Sandbox/"
# image  folder
alias img="cd ~/Images/"
# documents folder
alias docs="cd ~/Documents/"
# ObsidianVault folder
alias vault="cd ~/Documents/ObsidianVault/MyVault/"
# ls
alias ls="colorls --sd"
# lsla
alias lsd="colorls -la --sd"
# lsa
alias lsa="colorls -a --sd"
# live aerver
alias live="live-server"
# shells
alias tobash="bash"
alias tozsh="zsh"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/gitmux

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# -- SETTING THE STARSHIP PROMPT --
eval "$(starship init zsh)"
precmd() { precmd() { echo } }

# start NeoFetch
#neofetch

# Define the history-fzf-execute function
function history-fzf-execute {
  local selected_line=$(history -r | awk '{printf "%-5s %s\n", NR, substr($0, index($0,$2))}' | fzf --ansi)
  if [[ -n "$selected_line" ]]; then
    echo "!${selected_line%% *}"
    read -q "choice?Do you want to execute this command? (y/n) "
    if [[ "$choice" == "y" ]]; then
      local command_to_run=${selected_line#* }
      setopt LOCAL_OPTIONS NO_HIST_VERIFY
      eval "$command_to_run"
      unsetopt LOCAL_OPTIONS NO_HIST_VERIFY
    fi
  fi
}
# history-fzf-execute wrapper
zle -N history-fzf-execute{,}

# lf icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"



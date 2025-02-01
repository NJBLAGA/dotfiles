# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/njblaga/.zshrc' 

# shells
alias tobash="bash"
alias tozsh="zsh"
# home 
alias home="cd ~/"
# open
alias open="xdg-open"
# ls
alias ls="colorls"
# search fzf 
bindkey -s '^[ ' 'fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -r nvim\n'
# search history  fzf
bindkey '^[h' history-fzf-execute

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

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autostart Tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t Dev || tmux new -s njblaga
fi

# Default Apps
#export EDITOR="nvim"
export TERMINAL="kitty"

# -- SETTING THE STARSHIP PROMPT --
eval "$(starship init zsh)"

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

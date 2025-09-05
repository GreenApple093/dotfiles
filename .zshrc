

# --- Basic Setup ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"  
plugins=(git sudo history-substring-search)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# --- Quality of Life ---
# Use modern ls replacement if available
if command -v exa >/dev/null 2>&1; then
  alias ls="exa --icons --group-directories-first"
  alias ll="exa -alh --icons --group-directories-first"
else
  alias ll="ls -alh --color=auto"
fi

alias la="ls -A"
alias l.="ls -d .* --color=auto"

# Safer commands
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Clear screen
alias c="clear"

# Quick fix for typos
alias sl="ls"

# --- Networking & Hacking Helpers ---
alias myip="curl ifconfig.me"
alias ports="ss -tuln"        # List listening ports
alias scan="nmap -sC -sV"     # Quick nmap scan alias
alias sniff="sudo tcpdump -i any -nn" # Simple packet sniffing
alias serve="python3 -m http.server 8080" # Quick web server

# --- Git Shortcuts ---
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# --- Python / Virtualenv ---
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias venv="python3 -m venv venv && source venv/bin/activate"

# --- History Improvements ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_DUPS     # don’t store duplicate commands
setopt HIST_IGNORE_SPACE    # don’t save commands starting with space
setopt HIST_VERIFY          # show before running
bindkey '^R' history-incremental-search-backward

# --- Prompt (powerlevel10k if installed) ---
if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

# --- Extra Goodies ---
# Syntax highlighting & autosuggestions (install separately)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# --- Fun ---
alias hackermode="toilet -f mono12 -F metal HACKERMODE"

echo "🔥 Welcome back, $(whoami)! Stay curious and hack the planet 🌍"


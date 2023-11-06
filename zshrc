export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/.scripts

# Add default node to path
export PATH=~/.nvm/versions/node/v20.8.1/bin:$PATH

# Load NVM
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use 

# default editor
export EDITOR="nvim"
# postgres
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Starship
eval "$(starship init zsh)"

#auto-suggestions:
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U promptinit; promptinit; 
autoload -U compinit bashcompinit
compinit
bashcompinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true

autoload -U select-word-style
select-word-style bash


# alias
alias python='python3'
alias ll='ls -larth'
alias vi='nvim'
alias vim='nvim'
alias du='du -hd1'
alias c='code'
alias s='subl'
alias cf='cp -r'
alias rmd='rm -R -i'
alias rm='rm -i'
alias grep='grep --color'
alias clean='sudo clean.sh | lolcat'
alias timer='sudo timer.sh'
alias timerkill='sudo timerkill.sh'
alias obs1='open "obsidian://open?vault=Vault"'
alias obs2='open "obsidian://open?vault=priv"'

#Config loading
alias vimrc='vi ~/.config/nvim/init.vim'
alias zshrc='vi ~/.zshrc'

# Maximale Anzahl von Befehlen session (arrow key)
HISTSIZE=5000
# Maximale Anzahl von Befehlen; .zsh_history gespeichert werden
SAVEHIST=1000

# STARSHIP NEW LINE
SPACESHIP_PROMPT_ADD_NEWLINE=false
# newline handler
_newline_needed=false
_newline_handler() {
     _trimmed_buffer=$(echo "$BUFFER" | sed 's/ *$//')
     for _pattern in "clear" "reset"; do
         if [ "$_trimmed_buffer" = "$_pattern" ]; then
             _newline_needed=false
             break
         fi
     done
     unset _pattern
     unset _trimmed_buffer
     zle .accept-line
}
# change the behavior for hitting enter
zle -N accept-line _newline_handler
# print newline before prompt if needed
precmd() {
    if $_newline_needed; then
         echo ""
     else
         _newline_needed=true
     fi
}

# Funktion, um das Prompt-Format zu aktualisieren
# function set_prompt() {
#     local TIME=$(date +%H:%M:%S)
#     local branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"
#  if [ -n "$branch_name" ]; then                
#       PROMPT="%F{black}%K{51}[$TIME %f%K{208}%F{black} $branch_name%f%F{black}%K{51} %~]%f%k   
#🌵 "
#     else
#         PROMPT="%F{black}%K{51}[$TIME %~]%f%k
#🌵 "
#     fi
# }

# Funktion, die vor jedem Prompt-Update aufgerufen wird
#function precmd() {
#    set_prompt
#}

#Initialisierung des Prompt-Formats
#set_prompt


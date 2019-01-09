export EDITOR="nvim"
alias vim=nvim

setopt NO_NOMATCH # See https://github.com/robbyrussell/oh-my-zsh-issues/449
setopt HIST_IGNORE_SPACE

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

antigen bundle extract
antigen bundle git
antigen bundle gitignore
antigen bundle github
antigen bundle golang
antigen bundle heroku
antigen bundle yarn
antigen bundle z

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen apply

# Up arrow
bindkey '^[[A' history-substring-search-up
# Down arrow
bindkey '^[[B' history-substring-search-down

export BAT_THEME="base16-gruvbox-dark-hard"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
export VIRTUAL_ENV_DISABLE_PROMPT=1

CARGO_PATH="$HOME/.cargo/bin"
YARN_PATH="$(yarn global bin)"
PIP_PATH="$(python -m site --user-base)/bin"
CS140E_PATH="/usr/local/bin/aarch64-none-elf/bin"
export PATH="$CARGO_PATH:$YARN_PATH:$PIP_PATH:$CS140E_PATH:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
eval "$(direnv hook zsh)"


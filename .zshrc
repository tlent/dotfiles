export EDITOR="nvim"
alias vim=nvim

export BAT_THEME="base16-gruvbox-dark-hard"

setopt NO_NOMATCH # See https://github.com/robbyrussell/oh-my-zsh-issues/449
setopt HIST_IGNORE_SPACE

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source /usr/local/share/antigen/antigen.zsh
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

CARGO_PATH="${HOME}/.cargo/bin"
PYTHON_PATH="$(brew --prefix)/opt/python/libexec/bin"
PIP_PATH="$(python -m site --user-base)/bin"
CARGO_PATH="$HOME/.cargo/bin"
CS140E_PATH="/usr/local/bin/aarch64-none-elf/bin"
export PATH="${CARGO_PATH}:${PIP_PATH}:${CS140E_PATH}:${PYTHON_PATH}:${PATH}"

source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh

eval "$(direnv hook zsh)"


export EDITOR="nvim"
alias vim=nvim

setopt NO_NOMATCH # See https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt HIST_IGNORE_SPACE

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# NOTE: these don't seem to work unless they are before antigen!
source /usr/local/Cellar/fzf/0.18.0/shell/completion.zsh
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{.git,node_modules}/*' -g '!{yarn.lock,package-lock.json,go.sum}' 2>/dev/null"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

export DOCKER_CONFIG="${HOME}"/.docker
export GOPATH="${HOME}/go"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NPM_PACKAGES="${HOME}/.npm-packages" # For global npm packages without root

CARGO_PATH="${HOME}/.cargo/bin"
GO_PATH="${GOPATH}/bin"
NPM_PACKAGES_PATH="${NPM_PACKAGES}/bin"
PIP_PATH="${HOME}/.local/bin"
HOME_PATH="${HOME}/bin"
export PATH="${CARGO_PATH}:${GO_PATH}:${NPM_PACKAGES_PATH}:${PIP_PATH}:${HOME_PATH}:${PATH}"

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

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# NOTE: this only seems to work after antigen!
source /usr/local/Cellar/fzf/0.18.0/shell/key-bindings.zsh

# Up arrow
bindkey '^[[A' history-substring-search-up
# Down arrow
bindkey '^[[B' history-substring-search-down

source "${0:h}/macos.zsh"
source "${0:h}/fzf.zsh"

alias l=ll
alias lrt='lt'
alias ...='../..'
alias ....='../../..'
alias x=dtrx

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Load rbenv
if (( $+commands[rbenv] )); then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init - --no-rehash zsh)"
fi

# Load NVM if available
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh" --no-use

  # fix nvm startup time by using '--no-use' and this:
  NODE_VERSION=`cat $NVM_DIR/alias/default`
  export NVM_BIN="$NVM_DIR/versions/node/$NODE_VERSION/bin"
  export PATH=$NVM_BIN:$PATH
fi

# Load NPM completion.
if (( $+commands[npm] )); then
  cache_file="${TMPDIR:-/tmp}/prezto-node-cache.$UID.zsh"

  if [[ "$commands[npm]" -nt "$cache_file" \
        || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
        || ! -s "$cache_file" ]]; then
    # npm is slow; cache its output.
    npm completion >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"

  unset cache_file
fi

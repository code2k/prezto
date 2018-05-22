# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

# https://github.com/rupa/z/ -> "brew install z"
if [[ -s "$(brew --prefix)/etc/profile.d/z.sh" ]]; then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi

# Needs "brew install coreutils"
if [[ -s "$(brew --prefix)/bin/gls" ]]; then
  alias ls="$(brew --prefix)/bin/gls --color --group-directories-first"
fi

# macOS specific alias:
alias dnsflush="dscacheutil -flushcache"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

path=(
  /usr/x11/bin
  $path
)


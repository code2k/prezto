# Quick jump functions.
#
# Neeeds:
#  - https://github.com/junegunn/fzf
#  - https://github.com/rupa/z/

# Return if requirements are not found.
if (( ! $+commands[fzf] || ! $+functions[_z] )); then
  return 1
fi

fzf_down() {
   fzf "$@" --height 50% --border --color=light
}

zz() {
  d=$(z | cut -c 12- | fzf_down --tac +m -q "$1")
  [[ -z "$d" ]] && return 0
  if [[ -d "$d" ]]; then
    cd "$d"
  else
    echo "Directory does not exists: $d"
  fi
}

cdfind() {
  local d
  d=$(find . -type d -not \( -path ./.git -prune \) -not \( -path ./node_modules -prune \) -print | fzf_down +m -q "$1")
  [[ ! -z "$d" ]] && cd "$d"
}



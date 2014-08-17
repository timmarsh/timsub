if [[ ! -o interactive ]]; then
    return
fi

compctl -K _tim tim

_tim() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(tim commands)"
  else
    completions="$(tim completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

#!/usr/bin/env bash

last_word() {
  text="$1"
  text_length="$(echo "$text" | wc -w)"
  echo "$text" | cut -d' ' -f"$text_length"
}

main() {
  if [[ "$#" -gt 0 ]]
  then
    last_word "$*"
  else
    read input
    last_word "$input"
  fi
}

main "$@"
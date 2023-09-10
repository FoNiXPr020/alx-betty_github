#!/bin/bash

input_file="$1"

function format_comment_line() {
  local line="$1"
  if [[ ${#line} -gt 77 && "$line" =~ ^\* ]]; then
    excess_chars="${line:77}"
    line="${line:0:77}"
    if [[ "$line" =~ ^\*\ (main|Description|Return) ]]; then
      echo "* $line"
    else
      echo "$line"
    fi
    while [[ -n "$excess_chars" ]]; do
      if [[ ${#excess_chars} -gt 77 ]]; then
        next_line="${excess_chars:0:77}"
        excess_chars="${excess_chars:77}"
      else
        next_line="$excess_chars"
        excess_chars=
      fi
      echo "* $next_line"
    done
  else
    echo "$line"
  fi
}

inside_comment=false
output_lines=()

while IFS= read -r line; do
  if [[ "$line" == "/**" ]]; then
    inside_comment=true
  fi

  if [[ -n "$inside_comment" ]]; then
    if [[ "$line" == " */" ]]; then
      inside_comment=
    else
      line=$(format_comment_line "$line")
    fi
  fi

  output_lines+=("$line")
done < "$input_file"

printf "%s\n" "${output_lines[@]}" > "$input_file"

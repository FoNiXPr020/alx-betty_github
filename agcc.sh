#!/bin/bash
# FoNiX - ALX Advanced Betty : https://github.com/FoNiXPr020/alx-betty_github
# Compiler GCC Alais as agcc filename or multifile.

if [ "$#" = "0" ]; then
  echo "Usage: agcc [source_file1] [source_file2] [source_file3]..."
  echo "Compile C code using GCC with specified Files."
  exit 1
fi

ARG_DEFAULT="gcc -Wall -Werror -Wextra -pedantic -std=gnu89"
ARG_FILES=""
ARG_BR=" "

for arg in "$@"; do
	ARG_FILES=${ARG_FILES}${ARG_BR}"${arg}"
done

${ARG_DEFAULT} ${ARG_FILES}

#!/bin/bash
# FoNiX - ALX Advanced Betty : https://github.com/FoNiXPr020/alx-betty_github
# Installation of clean betty files. includes some functions

agcc_file="agcc.sh"
betty_file="alxbetty.sh"
mkbetty_file="mkbetty.sh"
template_file="template.c"

destination_dir="$HOME/Github"

if [ ! -d "$destination_dir" ]; then
	  mkdir -p "$destination_dir"
	    echo "Created directory: $destination_dir"
fi

chmod a+x "$agcc_file"
chmod a+x "$betty_file"
chmod a+x "$mkbetty_file"
chmod a+x "$template_file"
echo "Executed Files successfully."

if cp "$agcc_file" "$destination_dir" && cp "$betty_file" "$destination_dir" && cp "$mkbetty_file" "$destination_dir" && cp "$template_file" "$destination_dir";  then
    echo "Transfer files successfully."
else
    echo "Transfer files failed."
    exit 1
fi

alias_to_agcc="alias agcc='$destination_dir/$agcc_file'"
alias_to_betty="alias alxbetty='$destination_dir/$betty_file'"
alias_template="alias mkbetty='$destination_dir/$mkbetty_file'"

if grep -q "$alias_to_agcc" "$HOME/.bashrc" || grep -q "$alias_to_agcc" "$HOME/.bash_aliases"; then
	  echo "Alias 'agcc' already exists in ~/.bashrc or ~/.bash_aliases."
  else
	    if [ -f "$HOME/.bash_aliases" ]; then
		        echo "Adding alias to ~/.bash_aliases..."
			    echo "$alias_to_agcc" >> "$HOME/.bash_aliases"
			      else
				          echo "Adding alias to ~/.bashrc..."
					      echo "$alias_to_agcc" >> "$HOME/.bashrc"
		fi
		echo "agcc added successfully."
fi

if grep -q "$alias_to_betty" "$HOME/.bashrc" || grep -q "$alias_to_betty" "$HOME/.bash_aliases"; then
	  echo "Alias 'alxbetty' already exists in ~/.bashrc or ~/.bash_aliases."
  else
	    if [ -f "$HOME/.bash_aliases" ]; then
		        echo "Adding alias to ~/.bash_aliases..."
			    echo "$alias_to_betty" >> "$HOME/.bash_aliases"
			      else
				          echo "Adding alias to ~/.bashrc..."
					      echo "$alias_to_betty" >> "$HOME/.bashrc"
		fi
		echo "alxbetty added successfully."
fi

if grep -q "$alias_template" "$HOME/.bashrc" || grep -q "$alias_template" "$HOME/.bash_aliases"; then
	  echo "Alias 'mkbetty' already exists in ~/.bashrc or ~/.bash_aliases."
  else
	    if [ -f "$HOME/.bash_aliases" ]; then
		        echo "Adding alias to ~/.bash_aliases..."
			    echo "$alias_template" >> "$HOME/.bash_aliases"
			      else
				          echo "Adding alias to ~/.bashrc..."
					      echo "$alias_template" >> "$HOME/.bashrc"
		fi
		echo "mkbetty added successfully."
fi

rm "$agcc_file"
rm "$betty_file"
rm "$mkbetty_file"
rm "$template_file"

echo "Installation completed."
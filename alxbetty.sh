#!/bin/bash
# FoNiX - ALX Advanced Betty : https://github.com/FoNiXPr020/alx-betty_github
# ALX - Advanced way to make your Betty style clean.

if [ "$#" -eq 0 ]; then
    echo -e "Please provide C or Python source file(s) to clean.."
    exit 1
fi

num_runs=2

for file in "$@"; do

    if [[ "$file" == *.c || "$file" == *.py ]]; then

        for run in $(seq $num_runs); do

            replace_spaces_with_tabs() {
                sed -i 's/ \{2,\}/\t/g' "$file"
            }
			
            # Replace spaces before tabs with tabs
            replace_spaces_before_tabs() {
                sed -i 's/[[:blank:]]*\t/\t/g' "$file"
            }

            # Function full with bugs...
            # fix_line_length() {
            # 	sed -i -e '/^\/\*\*/,/\*\/$/s/\(.\{78\}\)\(.*\)/\1\n* \2/g' -e '/^\/\/.\{78\}$/s/\(.\{78\}\)\(.*\)/\1\n* \2/g' "$file"
            # }
			
			# ============================================================================================================================ 
            # ============================================= Betty 80 Chars FIX =========================================================== #
            # ============================================================================================================================ #

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
            done < "$file"

            printf "%s\n" "${output_lines[@]}" > "$file"

            # ============================================================================================================================ # 
            # ============================================================================================================================ # 

            # Leading tabs
            fix_leading_tabs() {
                sed -i 's/^[ \t]*//g' "$file"
            }

            # Conditional statements | new upgrade will be available inchalah.
            fix_conditionals_indentation() {
                sed -i 's/if(/if (/g' "$file"
                sed -i 's/for(/for (/g' "$file"
                sed -i 's/while(/while (/g' "$file"
            }

            # Trailing whitespace
            sed -i 's/[ \t]*$//' "$file"

            # Replace ( * ) with (*)
            sed -i 's/([[:blank:]]/(/g' "$file"
            sed -i 's/[[:blank:]])/)/g' "$file"

            # Run all functions.
			replace_spaces_before_tabs
            replace_spaces_with_tabs
            fix_leading_tabs
            fix_conditionals_indentation

        done  # END run loop

		# else
        # echo "Skipping $file (Not a C or Python source file)" # Just for test...
    fi
	echo -e ""
	echo -e "(================ $file ================)"
done  # END file loop

echo -e "(============= Betty style ================)"
echo -e "(=============== Cleaned ================)"
echo -e "(Report issues: github.com/FoNiXPr020)"
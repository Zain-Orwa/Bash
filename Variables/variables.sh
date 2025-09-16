#!/usr/bin/env bash
# Bash Variables — script.sh
# Goal: runnable examples + explanations in comments.
#
# =========================
# Table of Contents
# =========================
#  1) Naming and assignment
#  2) Referencing variables
#  3) Quoting rules
#  4) Export and environment
#  5) Read-only and unsetting
#  6) Arithmetic with integers
#  7) Command substitution
#  8) Arrays (indexed)
#  9) Associative arrays
# 10) Parameter expansion tools
# 11) Tests for set/unset and length
# 12) Input to variables
# 13) Local scope in functions
# 14) Special parameters
# 15) Indirect and nameref
# 16) Case conversion and trimming
# 17) Exporting PATH safely
# 18) Debugging variables
# 19) Best practices summary


###############################################################################
# 1) Naming and assignment
###############################################################################
name="Zain"
age=22
_greeting="Hello"
echo "$_greeting, my name is $name and I'm $age."
echo -e "\n---\n"


###############################################################################
# 2) Referencing variables
###############################################################################
lang="Bash"
echo "Learning ${lang}script"
echo "Home is $HOME"
echo -e "\n---\n"


###############################################################################
# 3) Quoting rules
###############################################################################
file="notes.txt"
echo "File is $file"
echo 'File is $file'
echo -e "\n---\n"


###############################################################################
# 4) Export and environment
###############################################################################
api_key="ABC123"
export api_key
echo "api_key exported (check with: env | grep api_key)"
echo -e "\n---\n"


###############################################################################
# 5) Read-only and unsetting
###############################################################################
readonly company="Acme"
temp="to remove"
unset temp
echo "Company is $company (readonly)"
echo -e "\n---\n"


###############################################################################
# 6) Arithmetic with integers
###############################################################################
x=7
y=5
(( sum = x + y ))
echo "sum=$sum"
echo "prod=$(( x * y ))"
(( x++ , y+=3 ))
echo "x=$x y=$y"
echo -e "\n---\n"


###############################################################################
# 7) Command substitution
###############################################################################
now=$(date +'%Y-%m-%d %H:%M:%S')
echo "Now: $now"
echo -e "\n---\n"


###############################################################################
# 8) Arrays (indexed)
###############################################################################
fruits=(apple banana cherry)
echo "First: ${fruits[0]}"
fruits+=("date")
echo "All: ${fruits[@]}"
echo "Count: ${#fruits[@]}"
echo "Indices: ${!fruits[@]}"
echo -e "\n---\n"


###############################################################################
# 9) Associative arrays
###############################################################################
declare -A capitals
capitals[Austria]="Vienna"
capitals[France]="Paris"
echo "AT: ${capitals[Austria]}"
echo "Keys: ${!capitals[@]}"
echo "Vals: ${capitals[@]}"
echo -e "\n---\n"


###############################################################################
# 10) Parameter expansion tools
###############################################################################
unset nickname
echo "Default: ${nickname:-Guest}"
username="zain"
echo "Upper: ${username^^}"
echo "Substr: ${username:1:2}"
path_sample="/usr/local/bin/script.sh"
echo "Basename: ${path_sample##*/}"
echo "Dirname: ${path_sample%/*}"
text="foo_bar_bar"
echo "Replace first: ${text/bar/BAR}"
echo "Replace all:   ${text//bar/BAR}"
echo -e "\n---\n"


###############################################################################
# 11) Tests for set/unset and length
###############################################################################
var=""
echo "Set? ${var+x}"
echo "Length: ${#var}"
echo -e "\n---\n"


###############################################################################
# 12) Input to variables
###############################################################################
read -r -p "Enter your city: " city
echo "City: $city"
echo -e "\n---\n"


###############################################################################
# 13) Local scope in functions
###############################################################################
score=0
bump() {
  local score=100
  echo "Inside: $score"
}
bump
echo "Outside: $score"
echo -e "\n---\n"


###############################################################################
# 14) Special parameters
###############################################################################
echo "Script: $0"
echo "Arg count: $#"
echo "Args: $*"
echo "Args safely: $@"
ls >/dev/null 2>&1
echo "Last status: $?"
echo -e "\n---\n"


###############################################################################
# 15) Indirect and nameref
###############################################################################
target="name"
echo "Indirect value of 'target' -> ${!target}"
declare -n ref_to_fruits=fruits
ref_to_fruits[1]="BANANA"
echo "Nameref change -> ${fruits[@]}"
echo -e "\n---\n"


###############################################################################
# 16) Case conversion and trimming
###############################################################################
s="  Bash  "
echo "lower: ${s,,}"
echo "upper: ${s^^}"
echo "Trim with xargs: '$(echo "$s" | xargs)'"
echo -e "\n---\n"


###############################################################################
# 17) Exporting PATH safely
###############################################################################
bin_dir="$HOME/bin"
case ":$PATH:" in
  *":$bin_dir:"*) ;;
  *) PATH="$bin_dir:$PATH" ;;
esac
export PATH
echo "PATH updated: $PATH"
echo -e "\n---\n"


###############################################################################
# 18) Debugging variables
###############################################################################
declare -p name age fruits capitals 2>/dev/null
echo -e "\n---\n"


###############################################################################
# 19) Best practices summary
###############################################################################
echo "Summary:"
echo "- Always quote expansions"
echo "- Prefer \$() over backticks"
echo "- Use local in functions"
echo "- Use arrays for lists"
echo "- Parameter expansion for safe defaults"
echo -e "\n---\n"

echo "Done."


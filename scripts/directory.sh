function v() 
{
	if [ $# -eq 0 ]; then
		vim .;
	else
		vim "$@";
	fi;
}
function o()
{
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled
function tre() 
{
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Enter new created directory 
function mkd() # Create a new directory and enter it
{
	mkdir -p "$@" && cd "$_";
}
# Change working directory to the top-most Finder window location 
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Determine size of a file or total size of a directory
function fs() 
{
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi;
}

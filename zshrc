# Export Value {{{
# Export OH MY ZSH {{{
export ZSH=$HOME/.oh-my-zsh
# }}}
# Export ICLOUD{{{
export ICLOUD=$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs
# }}}
# Export TERM {{{
export TERM=rxvt-256color
# }}}
# Export PATH {{{
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:/Users/giangle/Library/Python/2.7/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Users/giangle/.rvm/rubies/default/bin"
export PATH="$PATH:/Users/giangle/node_modules/.bin"
export PYTHONPATH=""
# }}}
# {{{ Export Trello Task Key
export TRELLO_API_KEY="9929dc08d45a72575d985f7a4b078869"
export TRELLO_API_SECRET="38d6cdcf86483c4da9af15c4eeb3592bba1c45b0b6072ea72e042d67f4b7b94d"
export TRELLO_NAME="TrelloWarrior"
export TRELLO_EXPIRATION="never"
# }}}
# Export Taskwarrior Configuration {{{
export TASKRC=~/.taskrc 
export PS1='$(task +in +PENDING count) '$PS1
# }}}
# UTF8 {{{
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# }}}
# }}}

# ZSH THEME {{{
ZSH_THEME="wezm"
# }}}

# Functions {{{
# Simple Calculator {{{
function calc() 
{
	local result="";
	result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
	#                       └─ default (when `--mathlib` is used) is 20
	#
	if [[ "$result" == *.* ]]; then
		# improve the output for decimal numbers
		printf "$result" |
		sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
		    -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
		    -e 's/0*$//;s/\.$//';  # remove trailing zeros
	else
		printf "$result";
	fi;
	printf "\n";
}
# }}}
# Enter new created directory {{{
function mkd() # Create a new directory and enter it
{
	mkdir -p "$@" && cd "$_";
}
# }}}
# Change working directory to the top-most Finder window location {{{
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}
# }}}

# Determine size of a file or total size of a directory{{{
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
# }}}
# Use Git’s colored diff when available {{{
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;
# }}}
# Create a data URL from a file {{{
function dataurl() 
{
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}
# }}}

# Start an HTTP server from a directory, optionally specifying the port {{{
function server() 
{
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}
# }}}
# Compare original and gzipped file size{{{
function gz() 
{
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}
# }}}
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json` {{{
function json() 
{
	if [ -t 0 ]; then # argument
		python -mjson.tool <<< "$*" | pygmentize -l javascript;
	else # pipe
		python -mjson.tool | pygmentize -l javascript;
	fi;
}
# }}}
# Run `dig` and display the most useful info {{{
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}
# }}}
# UTF-8-encode a string of Unicode symbols {{{
function escape() 
{
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}
# }}}
# Decode \x{ABCD}-style Unicode escape sequences {{{
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}
# }}}
# Get a character’s Unicode code point {{{
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}
# }}}
# `v` with no arguments opens the current directory in Vim, otherwise opens the given location {{{
function v() 
{
	if [ $# -eq 0 ]; then
		vim .;
	else
		vim "$@";
	fi;
}
# }}}
# `o` with no arguments opens the current directory, otherwise opens the given location {{{
function o()
{
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}
# }}}
# tre for short tree {{{
# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() # `tre` is a shorthand for `tree` with hidden files and color enabled
{
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
# }}}
# Git: Revert changes & Remove all untracked {{{
function grr() 
{
	git reset --hard;
	git clean -fd;
}
# }}}
# Git: Revert changes in specific file {{{
function gr() 
{
	git checkout HEAD $@;
}
# }}}
# Git: add all, commit and push. [-m "comment"] {{{
function gacp() 
{
	git add .;
	git commit $@
	git push
}
# }}}
# Docker: Removes all unused containers and images {{{
function dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
# }}}
# Flushes DNS {{{
function refreshdns() {
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}
# }}}
# Use php-cs-fixer for stagged files {{{
function phpfixstagged()
{
    git diff --cached --name-only --diff-filter=ACM >> ~/Temp/stagged
    for FILE in `cat ~/Temp/stagged`
    do
        echo "Fixing Coding Style for $FILE"
        ~/.composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer fix --config ~/.php_cs $FILE
    done
    rm -rf ~/Temp/stagged
}
# }}}
# Tickle function for GTD in TW {{{
tickle() {
    deadline=$1
    shift
    task add +in +tickle wait:$deadline $@
}
# }}}
# }}}

# Alias {{{
# Navigation aliases {{{
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias localip="ipconfig getifaddr en0"
# }}}
# Vim aliases {{{
alias zshconfig="vim ~/dotfiles/zshrc"
alias vimconfig="vim ~/dotfiles/vimrc"
alias vimpluginstall="vim +PluginInstall +qall"
alias sshconfig"vim ~/.ssh/config"
alias vim=/usr/local/bin/vim
# }}}
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Vagrant aliases {{{
alias vagstart="cd /ozv/hapitas_vagrant && vagrant up"
alias vagstop="cd /ozv/hapitas_vagrant && vagrant halt"
alias vagssh="cd /ozv/hapitas_vagrant && vagrant ssh"
# }}}
# Zsh aliases {{{
alias reload="source ~/.zshrc"
# }}}
# Php cs fixer alises {{{
alias phpfixs="phpfixstagged"
alias phpfix="~/.composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer fix --config ~/.php_cs"
# }}}
# Trello TW Sync aliases {{{
alias tsync="python ~/dotfiles/trellowarrior/trellowarrior.py"
# }}}
# MPD aliases {{{
alias startmpd="mpd -v --no-daemon ~/.mpd/mpd.conf"
alias mpd="mpd ~/.mpd/mpd.conf"
alias mpdk="mpd --kill"
alias music="ncmpcpp"
# }}}
# Configuration aliases {{{
alias zshalias="vim +/Configuration\ aliases ~/.zshrc "
# }}}
# Alias for GTD TW {{{
alias in='task add +in'
alias tick=tickle
alias think='tickle +1d'
# }}}
# }}}

# ZSH Plugin {{{
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git vox vagrant)
# }}}

# External Files {{{
# OH MY ZSH  {{{
source $ZSH/oh-my-zsh.sh
# }}}
# BASH PROFILE {{{
if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile  # Read Mac .profile, if present.
fi
# }}}
# RVM {{{
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# }}}
# Z plugin {{{
source ~/.dotfiles/z.sh
# }}}
# }}}

# Other Instruction {{{

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# }}}
# vim: foldmethod=marker
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

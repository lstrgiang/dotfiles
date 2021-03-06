# Flushes DNS 
function refreshdns() {
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}

# DNS
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# Start an HTTP server from a directory, optionally specifying the port 
function server() 
{
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}



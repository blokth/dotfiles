#!/usr/bin/env zsh

# has_cmd
#   Description:
#     Easily determine if a command exists
#   Usage:
#     if has_cmd docker; then
#       alias dc="docker-compose"
#       alias dcr="docker-compose run --rm"
#     fi
function has_cmd {
    hash "${1}" 2> /dev/null
}

alias ps=ps

# is_mac
#   Description:
#     Determine if OSTYPE matches "darwin"
#   Usage:
#     if is_mac; then
#       # do something on macOS
#     fi
function is_mac {
    [[ "$OSTYPE" =~ "darwin" ]]
}

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Get gzipped file size
function gz {
    local origsize=$(wc -c < "$1")
    local gzipsize=$(gzip -c "$1" | wc -c)
    local ratio=$(echo "$gzipsize * 100/ $origsize" | bc -l)
    local saved=$(echo "($origsize - $gzipsize) * 100/ $origsize" | bc -l)

    printf "orig: %d bytes\ngzip: %d bytes\nsave: %2.0f%% (%2.0f%%)\n" "$origsize" "$gzipsize" "$saved" "$ratio"
}

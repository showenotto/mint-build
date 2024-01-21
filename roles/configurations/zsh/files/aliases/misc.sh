#MISC
alias ls='ls --color'
alias ll='ls -lashF --color'
alias la='ls -CAshF --color'
alias l='ls -CFhas --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias sudo="sudo -E "

#NETCAT PORTS
LISTENING_PORTS=({0..9999})
for PORT in $LISTENING_PORTS; do
	alias $PORT="ncat -lnp $PORT "
done

#CREATING SERVERS
SERVER_PORTS=({0..9999})
for PORT in $SERVER_PORTS; do
	alias w-server-$PORT="python -m http.server $PORT"
done



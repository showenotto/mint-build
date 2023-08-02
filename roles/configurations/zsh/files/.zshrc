#Prompt
prompt_symbol=㉿
interface_name="lo"
interface=$(ip addr show dev $interface_name up | grep -o '^[0-9]*:[[:space:]][a-z0-9_]*:' | awk -F: '{print $2}' | sed s/\ //g)
ip=$(ip addr show dev $interface up | grep -o 'inet [0-9.]*' | awk '{print $2}')

PROMPT=$'%F{cyan}┌──(%B%F{blue}%n'$prompt_symbol$'%m%b%F{cyan})-[${interface}]-[${ip}]-[%*]-[%B%F{cyan}%(6~.%-1~/…/%4~.%5~)%b%F{cyan}]\n└─%B%F{blue}%%%f%b%F{cyan} '
#^Functions
#$Functions


#^Options
setopt correct #auto correct spelling mistakes
setopt notify 
setopt interactivecomments
setopt prompt_subst #PROMPT will undergo paramter substitution
#$Options


#^History Configs
HISTFILE=~/.zsh_history
HISTSIZE=1000000
setopt hist_expire_dups_first #del dups first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups  # ignore duplicated commands history list
#$History configs

#LS_COLORS
export LS_COLORS="di=36:ln=01;34so=36:pi=36:ex=36:bd=36:cd=36:su=36:sg=36:tw=36:ow=36:fi=36"

#^Key binds
bindkey '^[[Z' undo
bindkey '^U' backward-kill-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#$Key binds##


#Allow alias to expand on [TAB]
autoload -Uz compinit; compinit;
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#^Aliases
alias ll='ls -lashF'
alias la='ls -CAshF'
alias l='ls -CFhas'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
#NETCAT PORTS
PORT=({1024..9100})
for i in $PORT; do
	alias $i="ncat -lnp $i"
done

#$Aliases

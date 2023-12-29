export SSL_CERT_DIR=/etc/ssl/certs
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export PS1="╭─╼[\[\e[1;36m\]\w\[\e[0m\]]-(\`if [ \$? = 0 ]; then echo \[\e[32m\]1\[\e[0m\]; else echo \[\e[31m\]0\[\e[0m\]; fi\`)-[\[\e[1;32m\]\h\[\e[0m\]]\n╰─ \u\$(if git rev-parse --git-dir > /dev/null 2>&1; then echo '@git:('; fi)\[\e[1;34m\]\$(parse_git_branch)\[\e[0m\]\$(if git rev-parse --git-dir > /dev/null 2>&1; then echo ')'; fi) >> "

source ~/.venv/bin/activate
PROMPT_DIRTRIM=2
# /etc/profile.d/best_bash_history.sh
# Save 5,000 lines of history in memory
HISTSIZE=10000
# Save 2,000,000 lines of history to disk (will have to grep ~/.bash_history for full listing)
HISTFILESIZE=2000000
# Append to history instead of overwrite
shopt -s histappend
# Ignore redundant or space commands
HISTCONTROL=ignoreboth
# Ignore more
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

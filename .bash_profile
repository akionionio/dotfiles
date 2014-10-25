# .bash_profile

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

PS1="[\u@\h:\w]\n$ "
export TERM="xterm-256color"
PATH="$HOME/bin:$PATH"

alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -alG"

# share history
# http://iandeth.dyndns.org/mt/ian/archives/000651.html
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

# git
if [ -f ~/dotfiles/git-completion.bash ]; then
    source ~/dotfiles/git-completion.bash
fi

# plenv
if [ -d ~/.plenv ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

# rbenv
if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# ndenv
if [ -d ~/.ndenv ]; then
    export PATH="$HOME/.ndenv/bin:$PATH"
    eval "$(ndenv init -)"
fi

# pyenv
if [ -d ~/.pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# z
Z_PATH=( `brew --prefix`/etc/profile.d/z.sh )
for file in ${Z_PATH[@]}
do
    if [ -f $file ]; then
        . $file
        break
    fi
done

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME.gvm/bin/gvm-init.sh" ]] && source "/$HOME.gvm/bin/gvm-init.sh"

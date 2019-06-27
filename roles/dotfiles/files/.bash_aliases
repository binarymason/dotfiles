# Open file with whatever current editor is.  Defaults to PWD.
e() {
  $EDITOR "${1:-.}"
}

alias g="git"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit --verbose"
alias gca="git commit --amend --no-edit"
alias gcb="git checkout -b"
alias gd="git diff"
#alias git="hub"
alias gh="hub browse"
alias gl="git log --decorate --graph --oneline"
alias gp="git push"
alias gpl="git pull"
alias gppf="git push --force-with-lease"  #  "pretty please force push"
alias gpr="git pull-request"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gs='git status -sb'
alias gsh="git stash"
alias gsha="git stash apply"

alias fixup="gaa && gca && gppf"

alias qa="git checkout qa"
alias dev="git checkout development"
alias master="git checkout master"

alias grm="git rebase master"
alias grim="git rebase -i master"

# "Git Nuke" deletes everything but current branch
alias gnuke="git branch | grep -v '^*' | xargs git branch -D "

alias contributors=" git --no-pager log -s --format='%ae' | sort -u "

unalias gco 2>/dev/null
gco() {
  git checkout "$@" 2> /dev/null || git checkout -b "$@"
}

gclone() { git clone git@github.com:$1/$2.git && cd $(basename $2); }

alias browse="hub browse"
alias pr="hub pull-request"

alias green="blink1-tool --green"
alias red="blink1-tool --red"
#!/bin/sh

alias dotfiles="cd $DOTFILES_ROOT"
alias setup="$DOTFILES_ROOT/script/setup"
alias zshrc="$EDITOR ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias rz="source ~/.zshrc"


# Opens/creates a tmux session.
# If no parameter is given, an existing session will be loaded if available
#
# Usage t [session_name]
t(){
  local target=$1
  if [[ "$target" == "ls" ]]; then
    tmux ls 2&>/dev/null || echo "No sessions"
  elif [ ! $(tmux ls | grep "$target" | cut -c1-4) &> /dev/null ]; then
    tmux new -s "$target"
  else
    tmux attach -t "$target"
  fi
}

alias tc="$EDITOR ~/.tmux.conf"

alias rc="bundle exec rails c"
alias rs="bundle exec rails s"
alias rdm="bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=test"
alias fs="foreman start"

# fasd same behavior as autojump
alias j='fasd_cd -d'

# Alias mux to use oh-my-zsh completion plugin
alias mux="tmuxinator"

# Stops and removes all running docker containers
dnuke() {
  if [[ "$(docker ps -aq)" > /dev/null ]] ; then
    docker stop "$(docker ps -a -q)" && docker rm "$(docker ps -a -q)"
  fi
}


# Used for https://github.com/technekes/nib
alias nib='
docker run \
  -it \
  --rm \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  -v $HOME/.docker:/root/.docker:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e "DOCKER_HOST_URL=$DOCKER_HOST" \
  technekes/nib'

alias pry='
docker run \
  -it \
  --rm \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  -v $HOME/.docker:/root/.docker:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e "DOCKER_HOST_URL=$DOCKER_HOST" \
  colstrom/pry'

# focus(){
#   docker run \
#     -it \
#     --rm \
#     --add-host="localhost:10.0.2.2" \
#     -v $(pwd):$(pwd) \
#     -w $(pwd) \
#     -v $HOME/:/home \
#     -v $HOME/.docker:/root/.docker:ro \
#     -v /var/run/docker.sock:/var/run/docker.sock \
#     -p 8754:8754 \
#     -e "DOCKER_HOST_URL=$DOCKER_HOST" \
#     binarymason/focus-cli "$*"
# }


alias ip="curl icanhazip.com"

todo_path=$HOME/Desktop/todo.txt

todo() {
  timestamp=$(date +"%m/%d/%Y %H:%M")
  echo "$timestamp -- ${*}" >> "$todo_path"
}

todos() { if [ -f "$todo_path" ]; then cat "$todo_path"; fi }

alias notes="$EDITOR ~/Desktop/notes"


alias vi="vim"
alias vimrc="$EDITOR ~/.vim/vimrc"


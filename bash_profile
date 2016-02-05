# Git branch in prompt.
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_status() {
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    local status="$(git status 2>/dev/null)"
    local output='✔'
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}S"
    [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
    [[ -n $output ]] && output="$output"  # separate from branch name
    echo $output
}

git_color() {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory:
    # - Green if everything is clean
    # - Yellow if all changes are staged
    # - Red if there are uncommitted changes with nothing staged
    # - Magenta if there are both staged and unstaged changes
    local staged=$([[ $1 =~ \+ ]] && echo yes)
    local dirty=$([[ $1 =~ [!\?] ]] && echo yes)
    if [[ -n $staged ]] && [[ -n $dirty ]]; then
        echo -e '\033[0;35m'  # magenta
    elif [[ -n $staged ]]; then
        echo -e '\033[0;33m'  # yellow
    elif [[ -n $dirty ]]; then
        echo -e '\033[0;31m'  # red
    else
        echo -e '\033[0;32m'  # green
    fi
}

git_prompt() {
  local branch=$(parse_git_branch)
  if [[ -n $branch ]]; then
      local state=$(git_status)
      local color=$(git_color $state)
      # Now output the actual code to insert the branch and status
      echo -e "\x01$color\x02$state\x01\033[00m\x02"  # last bit resets color
  fi
}

export PS1="\D{%T} [\u:\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $(git_prompt) $ "

export HOMEBREW_GITHUB_API_TOKEN=xxxx

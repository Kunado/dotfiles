## tmux settings
## ---------------

# @see https://qiita.com/ssh0/items/a9956a74bff8254a606a

function select_session_to_attach() {
  # get existing sessions
  local sessions=$(tmux list-sessions)
  if [[ -z "${sessions}" ]]; then
    tmux new-session
  fi

  # add an option to create a new session
  local new_session="New Session"
  sessions="${sessions}\n${new_session}:"

  echo "${sessions}"

  # select a session
  local session="$(echo "${sessions}" | fzf | cut -d: -f1)"

  if [[ "${session}" = "${new_session}" ]]; then
    tmux new-session
  elif [[ -n "${session}" ]]; then
    tmux attach-session -t "${session}"
  else
    :
  fi
}

# select a tmux session to attach when booting a terminal
if [[ ! -n $TMUX && $- == *l* ]]; then
  select_session_to_attach
fi

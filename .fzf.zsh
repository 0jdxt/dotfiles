# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jay/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jay/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jay/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jay/.fzf/shell/key-bindings.zsh"

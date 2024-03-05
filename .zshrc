lsflags="--color --group-directories-first -F"

alias vim=nvim
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"

bindkey -v
bindkey '^N' forward-char

EDITOR=nvim
PROMPT='%n@%m %3~%(!.#.>) '

# History settings
HISTFILE=~/.history-zsh
HISTSIZE=10000
SAVEHIST=10000

setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

# Tab completion
autoload -Uz compinit && compinit
setopt complete_in_word         # cd /ho/us/tm<TAB> expands to /home/user/tmp
setopt auto_menu                # show completion menu on succesive tab presses

# MISC
setopt interactive_comments     # allow # comments in shell; good for copy/paste

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins  # default to insert mode
  echo -ne "\e[5 q"
}
zle -N zle-line-init

# .zshrc
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Key bindings for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^R' fzf-history-widget


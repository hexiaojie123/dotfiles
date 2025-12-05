# alt zsh >>>>>>>>>>>>>>>>>>>>>>>>>
ALT_ZSH="$HOME/.local/bin/zsh"
if [[ "$ZSH_VERSION" < "5.8" && -x "$ALT_ZSH" ]]; then # string comparision mistake ignored currently
    export SHELL="$ALT_ZSH"
    exec "$ALT_ZSH" -l
fi

# zinit >>>>>>>>>>>>>>>>>>>>>>>>>>
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
fpath+=($XDG_DATA_HOME/zsh/site-functions/) # completion
zinit load zsh-users/zsh-completions # completion
autoload -Uz compinit && compinit # completion
zinit load Aloxaf/fzf-tab # fzf
zinit load zsh-users/zsh-syntax-highlighting # highlight
zinit load zsh-users/zsh-autosuggestions # suggestion
zstyle ':completion:*' rehash true # completion
ZSH_AUTOSUGGEST_STRATEGY=(history completion) # completion

# history >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
export HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# env >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
export _ZO_ECHO=1

# tool >>>>>>>>>>>>>>>>>>>>>>>>>>>>
eval "$(zoxide init zsh --cmd cd)"
alias ls="eza --icons --group-directories-first"
alias ll="eza -l -a --icons --group-directories-first --header --git --time-style=long-iso"
alias lz="eza -l --icons --group-directories-first --total-size --header --git --time-style=long-iso"
alias lt="eza --tree --level=2 --icons"

# bindkey >>>>>>>>>>>>>>>>>>>>>>>
bindkey -v
bindkey -M viins '^[[A' history-search-backward
bindkey -M viins '^[[B' history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# into shell
typeset -U PATH
TMOUT=0
fastfetch

# source others
[[ -f "$XDG_CONFIG_HOME/p10k/.p10krc" ]] && source "$XDG_CONFIG_HOME/p10k/.p10krc"
[[ -f "$XDG_CONFIG_HOME/fzf/.fzfrc" ]] && source "$XDG_CONFIG_HOME/fzf/.fzfrc"
[[ -f "$XDG_CONFIG_HOME/zsh/.zshdiff" ]] && source "$XDG_CONFIG_HOME/zsh/.zshdiff"

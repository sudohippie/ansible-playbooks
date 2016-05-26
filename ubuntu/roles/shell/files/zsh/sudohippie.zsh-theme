# Machine name.
function host_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="\n  %{$fg[blue]%}-%{$fg[yellow]%} git%{$fg[white]%}:%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="\n%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$reset_color%}[%{$fg[red]%}x%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$reset_color%}[%{$fg[green]%}✓%{$reset_color%}]"

# NVM info
local nvm_info='$(nvm_prompt_info)'
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}⬢ "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

# meta info
local meta_info='$(meta_prompt_info)'
meta_prompt_info() {
	git_prompt_info
}

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}in \
%{$fg[yellow]%}${current_dir}%{$reset_color%}\
${meta_info} 
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(host_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${meta_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
fi

RPROMPT="${nvm_info}%{$reset_color%}"
# %{$fg[white]%}at \
# %{$fg[green]%}$(host_name) \
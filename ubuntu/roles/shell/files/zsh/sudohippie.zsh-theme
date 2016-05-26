# Local variables
local green="%{$fg[green]%}"
local blue="%{$fg[blue]%}"
local yellow="%{$fg[yellow]%}"
local red="%{$fg[red]%}"
local cyan="%{$fg[cyan]%}"
local white="%{$fg[white]%}"
local purple="%{\033[0;35m%}"
local reset="%{$reset_color%}"
local bold="%{$terminfo[bold]%}"

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="\n  ${blue}- git:%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${red}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${green}✓"

# Machine name.
function host_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir_name='${PWD/#$HOME/~}'
local current_dir_info='$(current_dir_prompt_info)'
function current_dir_prompt_info {
	git_prompt_info
}

#############################################
#                   PROMPT
#############################################
# Main prompt: normal user
PROMPT="
${bold}${blue}#${reset} \
${cyan}%n \
${white}in \
${yellow}${current_dir_name}${reset} \
${current_dir_info}
${bold}${red}$ ${reset}"

# Main prompt: root user
if [[ "$USER" == "root" ]]; then
PROMPT="
${bold}${blue}# \
${cyan}%n \
${white}in \
${yellow}${current_dir_name}${reset} \
${current_dir_info}
${bold}${red}$ ${reset}"
fi

# Right prompt: all users
# RPROMPT="Something on the right"

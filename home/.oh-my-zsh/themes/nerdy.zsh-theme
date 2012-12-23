# ----------------------------------------------------------------------------
# Using bits from Steve Losh
#   http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Shows little symbol '±' if you're currently at a git repo,
#                     '☿' if you're currently at a hg repo,
#                     '⚡' if you're currently at a svn repo,
#                 and '○' all other times
# ----------------------------------------------------------------------------
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '⚡' && return
    echo '○'
}

# ----------------------------------------------------------------------------
# svn prompt
# based on: https://gist.github.com/1156969 
# with help from: http://andrewray.me/bash-prompt-builder/index.html
# ----------------------------------------------------------------------------
function svn_prompt_info {
    # Set up defaults
    local svn_branch=""
    local svn_repository=""
    local svn_version=""
    local svn_change=""

    # only if we are in a directory that contains a .svn entry
    if [ -d ".svn" ]; then
        # query svn info and parse the results
        svn_branch=`svn info | grep '^URL:' | egrep -o '((tags|branches)/[^/]+|trunk).*' | sed -E -e 's/^(branches|tags)\///g'`
        svn_repository=`svn info | grep '^Repository Root:' | egrep -o '(http|https|file|svn|svn+ssh)/[^/]+' | egrep -o '[^/]+$'`
        svn_version=`svnversion -n`
        
        # this is the slowest test of the bunch
        change_count=`svn status | grep "?\|\!\|M\|A" | wc -l`
        if [ "$change_count" != "       0" ]; then
            svn_change=" [dirty]"
        else
            svn_change=""
        fi
        
        # show the results
        echo " %{$fg[blue]%}$svn_repository/$svn_branch %{$reset_color%}%{$fg[yellow]%}$svn_change%{$reset_color%}"
        
    fi
}

# ----------------------------------------------------------------------------
# git prompt variables
# depends on using Steve Losh fork of oh-my-zsh
# ----------------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} [dirty]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} [untracked]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ----------------------------------------------------------------------------
# zee prompt (ha ha)
# ----------------------------------------------------------------------------
PROMPT='
%{$fg[blue]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}${PWD/#$HOME/~}%b%{$reset_color%} $(git_prompt_info)$(svn_prompt_info)
$(prompt_char) '
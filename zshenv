# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yulong/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/opt/berkeley-db@4/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
if [[ -z "$LC_ALL" ]]; then
    export LC_ALL="en_US.UTF-8"
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_i64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias proxy="export http_proxy=http://127.0.0.1:7890; export https_proxy=http://127.0.0.1:7890; export ALL_PROXY=socks5://127.0.0.1:1080"
alias unproxy="unset all_proxy"
alias l="eza -lh"
alias ltree="eza --tree"
alias ltree2="eza --tree --level=2"
alias c="clear"
alias cl="c; l"
alias d="du -h --max-depth=1"
alias nproc="sysctl -n hw.logicalcpu"
alias sshcf7920="ssh -o ProxyCommand=\"/usr/local/bin/cloudflared access ssh --hostname idv7920.bio-nutshell.org\" niuyl@idv7920.bio-nutshell.org"
alias sftpcf7920="sftp -o ProxyCommand=\"/usr/local/bin/cloudflared access ssh --hostname idv7920.bio-nutshell.org\" niuyl@idv7920.bio-nutshell.org"
alias sshcf3640="ssh -o ProxyCommand=\"/usr/local/bin/cloudflared access ssh --hostname idv3640.bio-nutshell.org\" niuyl@idv3640.bio-nutshell.org"
alias sftpcf3640="sftp -o ProxyCommand=\"/usr/local/bin/cloudflared access ssh --hostname idv3640.bio-nutshell.org\" niuyl@idv3640.bio-nutshell.org"
alias s7=sshcf7920
alias t7=sftpcf7920
alias s3=sshcf3640
alias t3=sftpcf3640
alias rclone="/Users/yulong/Tools/rclone-v1.71.1-osx-amd64/rclone"
alias m7="rclone mount idv7920:/ ~/IDV7920 --vfs-cache-mode=minimal --vfs-cache-max-age=24h --vfs-cache-max-size=10G --dir-cache-time=24h --poll-interval=1m --attr-timeout=10s --vfs-read-chunk-size=8M --vfs-read-chunk-size-limit=64M --buffer-size=8M --umask=022 --daemon --daemon-timeout=30s --volname DebianServer"
alias um7="umount ~/IDV7920"
alias weather="curl v2.wttr.in/Paris"

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# command-not-found
HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
    source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi

# Following line was automatically added by arttime installer
export PATH=/Users/yulong/.local/bin:$PATH

## llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# ## onetbb
# ## onetbb was installed by home-brew
# export TBB="/usr/local/Cellar/tbb/2021.13.0"
# export TBB_INC="$TBB/include"
# export TBB_LIB="$TBB/lib"

## JAVA
export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'

## GNU
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

## Visual studio
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

## openblas
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig:$PKG_CONFIG_PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yulong/Tools/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yulong/Tools/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/yulong/Tools/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yulong/Tools/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


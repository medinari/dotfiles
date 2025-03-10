### .bash_profile

# get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

## User specific env. and startup programs

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set default editor:
export EDITOR=vim

# set custom prompt
#export PS1="\u@\h \w\$"

# aliases
alias dotfiles='/usr/bin/git --git-dir=/home/riccardo/.dotfiles/ --work-tree=/home/riccardo'
alias monika='/mnt/c/Users/raom2/Desktop/TrGe_scRNAseq_Ex/Seurat_Ex'
#alias dlmp3='/usr/bin/yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0'



## User specific functions
update_system() {
    if dpkg -l | grep -q "$1"; then
        echo "$1 is already installed."
    else
        echo "$1 is not installed. Installing..."
        sudo apt-get update && sudo apt-get install -y "$1"
        if [ $? -eq 0 ]; then
            echo "$1 has been successfully installed."
        else
            echo "Failed to install $1."
        fi
    fi
}


# list python virtual environments
#my_pyenv() {
#    printf "list python virtual environments\n"
#    ls $HOME/.virtualenvs/
#}

# Make sure to source your .bashrc after adding this
source ~/.bashrc
. "$HOME/.cargo/env"

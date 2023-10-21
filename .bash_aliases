# Some useful aliases.
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
alias h='history'
alias j="jobs -l"
alias ls="exa --group-directories-first"
alias l="ls"
alias la="ls -a"
alias ll="ls -la"
alias pu="pushd"
alias po="popd"
alias v="vim"
alias k="kubectl"
alias firefox='nohup firefox &'
alias files='nohup nautilus &'
alias terminator='nohup terminator &'

# Windows Terminal Ricing 🍙🍚
RICE='/mnt/c/Users/Usuario/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
alias dark="sed -i 's/\"colorScheme\": \"GruvboxLight\"/\"colorScheme\": \"GruvboxDark\"/' $RICE"
alias light="sed -i 's/\"colorScheme\": \"GruvboxDark\"/\"colorScheme\": \"GruvboxLight\"/' $RICE"

#
# Csh compatibility:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
_seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

# auto_pushd
function cd() {
    if [ -n "$1" ]; then
        pushd "$1" > /dev/null
    else
        pushd "$HOME" > /dev/null
    fi
}


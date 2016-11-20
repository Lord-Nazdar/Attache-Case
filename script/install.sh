# Define package manager
export PACKET="apt-get"
export SYSTEM="other"

# Are we running on cygwin?
unameRes=`uname`
cygPattern="CYGWIN"
if [[ $unameRes =~ $cygPattern ]]; then
	export SYSTEM="CYGWIN"
	echo "Running on Cygwin configuration"
	. ./cygwin/install
fi

# Update package list
eval $PACKET update

# Install and run all sub folders installation script
. ./git/install

. ./zsh/install

. ./vim/install

# Generate ssh keys
read -p "Enter email for ssh key:" keyemail
ssh-keygen -t rsa -b 4096 -C $keyemail

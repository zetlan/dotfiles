
## DOTFILES
export GIT_EDITOR=vim
export AWS_CREDENTIAL_PROFILES_FILE=$HOME/.aws/config
if [[ $PATH != *"/web/tools/scripts"* ]]
then
    echo "adding scripts to path"
    export PATH="/web/tools/scripts/:$PATH"
fi

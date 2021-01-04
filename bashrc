
## DOTFILES
export GIT_EDITOR=vim
#export AWS_CREDENTIAL_PROFILES_FILE=$HOME/.aws/config
if [[ $PATH != *"/web/tools/scripts"* ]]
then
    export PATH="/web/tools/scripts/:$PATH"
fi

alias esprod='ssh -L 8443:vpc-zola-production-h4qdqzhizodq3ufwm67fyiwfmi.us-east-1.es.amazonaws.com:443 52.5.99.28'


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH=/usr/local/mysql/bin:$PATH

##
# Your previous /Users/jitinnair/.bash_profile file was backed up as /Users/jitinnair/.bash_profile.macports-saved_2018-01-09_at_12:12:27
##

# MacPorts Installer addition on 2018-01-09_at_12:12:27: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jitinnair/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jitinnair/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jitinnair/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jitinnair/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# rbenv init to bash profile
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


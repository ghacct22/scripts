# scripts
Scripts i want to maintain

Source scripts/bashrc in your .bashrc/.bash_profile to load it.

Copy context.config.sample to context.config and fill out the first two params (systemname and bash)

In scripts/scripts.sh, comment out which ones you don't want loaded.

The Git-Extras add a lot of useful git commands to speed up your work, you can look them over [here](https://github.com/tj/git-extras)
It is easy to install, on mac it's as simple as `brew install git-extras`, but you can look at the installation instructions if you are using something else.
I highly reccomend installing this.

## Changelog
### 12.11.2015
- Stopped replacing the ~/.bashrc, since that is bad practice (really bad)
- Added my .tigrc, as an example
- Added a reference in the README to git-extras, which are awesome
### 12.9.2015
- Added git-prompt.sh
- Added git-completion.sh
- Added autoLink.sh to automatically create symlinks
- MF changes to bashrc
### 5.6.2015
- Added a changelog
- Moved features into different files
- added fuzzy file search for git branches in the grit command
- added switchAll commands, based on grit

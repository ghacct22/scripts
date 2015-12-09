# scripts
Scripts i want to maintain

I symlink bashrc from this folder so i don't have to copy them around. Please feel welcome to use my bashrc if your want to. It requires git's bash completion though, so you'd have to add that.

Symlynk command: ln -s /full/path/to/file /full/path/to/targer
Example:         ln -s ~/git/scripts/bashrc ~/.bashrc

You will need to modify bashrc with the path to the directory though, so it can run everything else.
`source ~/git/scripts/scripts.sh`
Change after `~` and before `scripts` for your path

In scripts/scripts.sh, comment out which ones you don't want loaded.

## Changelog
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

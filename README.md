# scripts
Scripts i want to maintain

I symlink bashrc from this folder so i don't have to copy them around. Please feel welcome to use my bashrc if your want to. It requires git's bash completion though, so you'd have to add that.

Symlynk command: ln -s /full/path/to/file /full/path/to/targer
Example:         ln -s ~/git/scripts/bashrc ~/.bashrc

You will need to modify bashrc with the path to the directory though, so it can run everything else.
`source ~/git/scripts/scripts.sh`
Change after `~` and before `scripts` for your path

In scripts/scripts.sh, comment out which ones you don't want loaded.

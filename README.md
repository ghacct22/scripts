# scripts
Scripts i want to maintain

I symlink bashrc from this folder so i don't have to copy them around.

Symlynk command: ln -s /full/path/to/file /full/path/to/targer
Example:         ln -s ~/git/scripts/work/bashrc ~/.bashrc

You will need to modify bashrc with the path to the directory though, so it can run everything else.
`source ~/git/scripts/work/scripts.sh`
Change after `~` and before `scripts` for your path

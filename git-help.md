# Tips & Tricks for Terminal and Git

## Terminal
* Use `cd` to change directories/folders
   * You can use just `cd` on its own to return back to home base if you are lost, or you can use `cd FOLDER-NAME` to hop into any folder at the next hierarchical level. That is, you will likely find it easiest to navigate by writing `cd desktop` before typing `cd natalia` when trying to access your repository.
* Use `pwd` to tell you where you are if you get lost
* If you want to see what files are in a folder, use `ls`

## Git
* Always make sure you are in the project repository before doing any work!
* **Always** use `git pull` to pull changes from the repository to your local machine
   * *Remember, this is not like Google Docs. This is more comparable to trying to work on a physical project from two different side of the room. You can't do this very well at the same time, so you need to return it to a center spot on the table from which your partner can then pick it up and resume their own work. Weird analogy, sorry.*
* These are the steps you should follow to make sure your changes are uploaded:
   1. Use `git add .` to add your local changes to the queue to be committed
   1. Use `git commit -m "TYPE-MESSAGE-HERE"` to commit your changes on your local machine to be pushed 
   1. Use `git push` push your local changes to the GitHub repository
* If at any point you want to check to make sure you are up to date, you can type `git status`
* Push and pull often! Doing this regularly (AKA at any good stopping point in your work) will make sure everythign stays organized and you don't run into any issues.

**If anything is confusing, reach out! I'm happy to help:)**

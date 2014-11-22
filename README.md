vimrc
=====

My current .vimrc.

Install Vundle first (https://github.com/gmarik/Vundle.vim)

Add, at least, these two directories: ~/.vimswap ~/.vimundo

Then (in Vim) run :BundleInstall to install all the plugins.


Setup
-------------------
I like to keep the git repository itself in a separate directory so first I clone this repository to a sub directory of my home folder:
```
git clone https://github.com/scazan/vimrc.git ~/.vimgit
```

Then I create a symbolic link in my home directory to the file I just downloaded:
```
ln -s .vimrc ./git/vimgit/.vimrc
```

If this is the first time I'm installing this then I need to make sure to run BundleInstall to get all those packages downloaded.
Startup vim then execute this:
```
:BundleInstall
```

Once it finishes exit vim (:q) and startup vim again. 
You should be all set to go at that point.

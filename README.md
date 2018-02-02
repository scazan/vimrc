vimrc
=====

My current .vimrc.

Requirements
-------------
Vundle (https://github.com/gmarik/Vundle.vim)

Add, at least, these two directories: ~/.vimswap ~/.vimundo

Setup
-------------------
Make sure you install Vundle first. Instructions here: https://github.com/gmarik/Vundle.vim

I like to keep the git repository itself in a separate directory so first I clone this repository to a sub directory of my home folder:
```
git clone https://github.com/scazan/vimrc.git ~/.vimgit
```

Then I create a symbolic link in my home directory to the file I just downloaded:
```
ln -s ~/.vimgit/.vimrc ~/.vimrc
```

<em>Note that if you cloned into a different directory than I did here (in my case ~/.vimgit) you will need to point to that location instead when creating the symbolic link.</em>

Create a few needed directories and also create an empty "extra config options" file for yourself by running this:
```
mkdir ~/.vimswap && mkdir ~/.vimundo && touch ~/.vimrc.config
```

If this is the first time I'm installing this then I need to make sure to run BundleInstall to get all those packages downloaded.
Startup vim then execute this inside of vim:
```
:BundleInstall
```

Once it finishes exit vim (:q) and startup vim again. 
You should be all set to go at that point.

OR JUST RUN THE INSTALL SCRIPT

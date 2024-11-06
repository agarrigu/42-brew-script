# 42-brew-script
Easily install brew without sudo in 42 school Linux machines, then you can install anything you want with 
```sh
brew install the-thing-you-want
```
 If you install it in `sgoinfre` folder you can *really* install anything you want.
 
 The first thing you install might take unusually long as it has to compile a bunch of basic stuff.

## running

Just clone this repository and run this script with `bash` from anywhere and it should work.

Default directory is `~/homebrew` and default .rc file is `.bashrc`, you can change this by editing the variables at the top of the script. 

After running the script restart your shell with e.g. `exec bash`, should be good to go then.

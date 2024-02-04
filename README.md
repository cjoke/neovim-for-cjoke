# cjokes nvim config. 

This is a fork from cpow/neovim-for-newbs, I did breake out and started to 
do my own research/voyage pretty early. I thought that would be a nice start.
Where the man also had some good youtube videos about his config aswell.

I forked this because of the other neovim distros where too complicated 
for me to both understand and exstend.

I have tried to be minimalistic as possible and at the same time have all the 
cool things. If you read through the commits you will se that this has been
a real rollercoaster. I have'nt figured out all things yet. But Im closing in. 

For debugging in python, you will need to `pip install debugpy` package 
and check out the keymappings <leader>d-(t,c,o,x)
nvim-dap with dap-ui is awesome.

To use all of the configuration in my repo, there are some packages you will 
need to install from your package manager and pip.

Some of the plugin authors claim that you will need the latest from neovim
I use latest stable. 
```
git
lazygit
python3-pynvim (if you dont use virtual environment)

```
I also use pyenv for handling my virtual environments - optional

if you encounter any problems you should check out requirements in the package
`:checkhealth` is complaining about. 


## Whats installed in mason plugin.
These plugins are needed for various configurations and plugins to work
mainly linters, languageservers and formatters for the lsp configuration.

    ◍ black
    ◍ clangd
    ◍ cpptools
    ◍ debugpy
    ◍ flake8
    ◍ lua-language-server lua_ls
    ◍ prettier
    ◍ pyright
    ◍ stylua


## Remote plugins.
Ive installed CopilotChat.nvim from a fork of the original plugin by gptlang
to update changes you need to :UpdateRemotePlugins. The python packages is in 
~/.config/nvim/rplugin/python3 directory. 


## Howto use this configuration
Remove or make a backup of.  

``` 
# remove
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim

```
```
# copy a backup
cp -a ~/.config/nvim ~/.config/nvim-backup
cp -a ~/.local/share/nvim ~/.local/state/nvim-backup
cp -a ~/.local/share/nvim ~/.local/share/nvim-backup

```
Now you clone this repository and place it in neovims config directory.

```

git clone git@github.com:cjoke/neovim-for-cjoke.git ~/.config/nvim

```
To remove this configuration and start from scratch with default neovim config
repeat the first step and just start neovim.


## Final words
I have made a virtual environment where I run pynvim which is required for 
some plugins in neovim. you can make your own environment or just install
it through your packagemanager. e.g debian/ubuntu `sudo apt install python3-pynvim`
you should also change the setting in options.lua.

`vim.g.python3_host_prog = "$HOME/.pyenv/versions/nvim/bin/python"`

If you want to check out my awesome config and I have forgotten to mention something
of importance, make an issue and I'll help out the best I can. 

Have fun sharing
Cheers!

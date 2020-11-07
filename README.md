## NEOVIM CONFIG from Lunarmask_

---

* This config assumes you are using __[NeoVim](https://neovim.io/)__ as your vim source.  
* I would also like to recommend using __Alacritty__ for your terminal emulator.
__[Alacritty](https://github.com/alacritty/alacritty)__ paired
with __[tmux](https://github.com/tmux/tmux)__ makes for a killer combo!


---------
### ABOUT

This configuration file tries to highlight the existing awesomeness of VIM.  
The goal is to expand some existing basic features without creating bloat.  

Please feel free to read through the `init.vim` file yourself for more information.  

---------
### SETUP

Firstly, you will need to install this config into your nvim folder.  

1) Download this `init.vim` file and place it into _`~/.config/nvim/`_.  
  * If this folder does not exist, create it!  

Secondly, this config doesn't make much sense without installing the proper plugins.  
This config assumes you are going to use VIM-Plug to manage your vim plugins.  

2) Install VIM-Plug https://github.com/junegunn/vim-plug You can either:  
  * Run one of the install scripts on the page for your vim version.  
  * Download `plug.vim` and place it into your _`~/.local/share/nvim/site/autoload/`_ folder.  

Thirdly, we will need to install the plugins through VIM-Plug.  

3) Launch `nvim` and enter `:PlugInstall` to install all your plugins.  
  * __nvim__ will likely give you an error complaining about referenced plugin modules
not being installed. This goes away after we install them.

__You're all set!__

### VIM GUIDE

Vim flows like a language (action movement object). It's important to keep this in
mind while learning to use it.  
Try to perform the minumum amount of key-presses to achive your edits!  

__[Your problem with VIM is that you do not Grok VI](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim#1220118)__

The __[VIM Cheat Sheet](https://vim.rtorr.com/)__ is a great resource that covers most things!

This small guide will try to cover the gaps from this config.

---------------------
##### Pane Management

`<C-w>v` Create a vertical split-pane  
`<C-w>s` Create a horizontal split-pane  
`<C-w>o` Maximize the current pane  
`<C-w>=` Make all panes the same size  

`,qa`   Close out of all panes  
`,qq`   Close out of selected pane  


---------------
##### Searching

`/`     Search document for _{regex}_<br>  
`#`     When cursor is over a word, highlight all instances in the document<br>  
`n`     Jump to the next instance of highlighted word<br>  
`N`     Jump to previous instance of highlighted word<br>  
`,h`    Turn off search highlighting<br>  
`,a`    Recursively search project for instances of _{regex}_ `:Ack {regex} <starting folder>`<br>  
`<C-p>` FuzzyFinder<br>  
`gf`    When cursor is on a module_name; jump to module<br>  


---------------
##### NerdTree

`,n` Toggle NerdTree open/closed  
`x`  Close parent-directory  


------------------
##### Miscelaneous

`,w`  Write current file  
`%`   Jump to the opening/closing statement/bracket  

`ci"` Change everything within a quote ex. `"Hello world"`  
`cit` Change everything within a html tag ex. `<div>hello world</div>`  
`ci[` Change everything within a right-bracket ex. `["hello", "world"]`  

`,c<spacebar>` Will comment/uncomment the row(s) selected  

`<` or `>` Will indent (by one margin) the selected row(s) left or right, respectively  

`ds<bracket>`  Removes the surrounding _<bracket>_ `{hello world} -> ds} -> hello world`  
`yss<bracket>` Surround line with _<bracket>_ `hello world -> yss" -> "hello world"`  

`"+y` Yank into System Clipboard (+)  
`"+p` Paste from System Clipboard (+)  
* The `+` In the above examples, could be any value. Some registers are special  


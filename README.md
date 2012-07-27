# tlee Vim Configuration

Head start courtesy of F/.


## Installation

To install the files and default configuration run the following:

    git clone https://github.com/tlee/vimfiles.git 
    cd vimfiles
    bash install.sh

This will install the default configuration files/directories, submodules, and create symbolic links for bundles and snippets. Most of the heavy lifting is done by the [install script][install.sh].

At this point you should have a default setup ready to rock. You're going to want to tune it a bit to your environment, so go forth and "Pimp Your Ride".


## Pimp Your Ride

The `install.sh` script created a `.vimrc.local` file. This stores local configurations based on the user's needs, it is loaded after the `.vimrc` file. Anything created in `.vimrc.local` overrides settings set in `.vimrc`. This file is ignored and not checked back into the repository. It's recommended you keep a backup of this somewhere.

You'll want to tune a few settings right off the bat. Open the `.vimrc.local` file (in Vim type `,evl` a mnemonic is "*edit vimrc local*").

1. Uncomment `g:yankring_history_dir` and optionally change it's path, otherwise `yankring` will save it's history in a file in your `$HOME` directory
- Optional, point `g:MarkdownPreviewUserStyles` to the directory where your user specific style sheets for the markdown previewer reside. If your an F/ peop, you can clone the repository for [F/ Markdown Themes][fmd-themes] and gain templates and style sheets to keep you out of MS Word.
- Set the default browser by changing `g:RefreshRunningBrowserDefault`. Use "chrome", "safari", or "firefox"
- Give yourself a signature with `g:snips_author` by including your name for various [snipmate][snipmate] snippets
- Optionally uncomment one of the `colorschemes`, there are 4 included as described below, the default is `colorblind`
- It's recommended to uncomment the entire conditional under *User GUI specific settings*. We roll with the [custom font MesloGM][MesloGM] at 12px. You'll need to download and install it, otherwise roll with Monaco or something if you want to go blind. If you want to set a transparency, you'll need to enable *Use experimental renderer* in MacVim's preferences -> Advanced settings. The primary reason for uncommenting this conditional is, you'll find certain plug-ins need to be disabled or have certain settings applied to work across MacVim and various \*nix environments.

You can apply custom key bindings in `.vimrc.local`, configure plug-ins, or override default settings.


## Updating

Submodule plug-ins generate `doc/tag` files associated with help documents every time Vim is launched. This creates conflicts associated with pulling, updating or committing changes back to the main repository. It's necessary to clean these out before running any pulls or commits.

There are two shell scripts included to help in this process [clean.sh][clean.sh] and [update.sh][update.sh].


### Updating From The Repository

To update from the latest changes in the repository run the following:

1. Quit out of Vim
- `bash clean.sh`
- `git stash` or `git add` any updates from your environment spit out by the `clean.sh` call to `git status`
- `git pull --rebase`

Commit your changes back up to the repository.


### Updating Submodules

To pull upstream changes for all of the submodules run the following:

1. Quit out of Vim
- `bash update.sh`
- `git stash` or `git add` any updates from your environment spit out by the `clean.sh` call to `git status`
- `git pull --rebase`

## Plug-Ins

Plug-ins are managed using [pathogen][pathogen]. All submodule plug-ins are stored in the `bundle_storage` directory and are not available to Vim until they are symlinked to the `bundle` directory. The `bundle` directory is ignored by the repository allowing custom configurations on a per install basis. To activate a plug-in run:

    ln -s ~/path/to/vimfiles/bundle_storage/bundle-name ~/path/to/vimfiles/bundle/bundle-name

You'll need to restart Vim for the changes to take effect.


### Adding New Plug-Ins As Submodules

New plug-ins need to be added to the `bundle_storage` directory and should be treated as submodules. To add a new one run:

    git submodule add <remote_repository> <home/.vim/bundle_storage/bundle-name>
    git submodule init
    git submodule update
    ln -s ~/path/to/vimfiles/bundle_storage/bundle-name ~/path/to/vimfiles/bundle/bundle-name

Test it out and if it's a keeper, add it to the repository, add it to the list below with a quick description and tell the world about it's greatness.

[Vim Scripts][vim-scripts] has an enormous amount of repositories for all sorts of plug-ins. However, if the original author has their own github repository, try to clone from there instead.


### Removing Submodules

   1. Delete the relevant line from the `.gitmodules` file
   - Delete the relevant section from `.git/config`
   - Run `git rm --cached path_to_submodule` (**no trailing slash!!**)
   - Remove the directory from `bundle_storage`
   - Remove the symbolic link from `bundle`
   - Remove any descriptions from the `README.md` file


### Default Plug-Ins

The [install script][install.sh] created initial symbolic links for the plug-ins listed below. These are primarily file type oriented plus a few must haves. You can disable any of these by removing the symbolic link, but it would be a lot cooler if you didn't.

- [ack.vim](https://github.com/mileszs/ack.vim/blob/master/doc/ack.txt)
- [browser-refresh.vim](https://github.com/mkitt/browser-refresh.vim/blob/master/doc/browser-refresh.txt)
- [cocoa.vim](https://github.com/msanders/cocoa.vim/blob/master/doc/cocoa.txt)
- [gist-vim](https://github.com/mattn/gist-vim)
- [jade.vim](https://github.com/vim-scripts/jade.vim)
- [json.vim](https://github.com/vim-scripts/JSON.vim)
- [markdown-preview.vim](https://github.com/mkitt/markdown-preview.vim/blob/master/doc/markdown-preview.txt)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter/blob/master/doc/NERD_commenter.txt)
- [nerdtree](https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt)
- [processing.vim](https://github.com/vim-scripts/Processing)
- [snipmate.vim](https://github.com/msanders/snipmate.vim/blob/master/doc/snipMate.txt)
- [statusline](https://github.com/factorylabs/vimfiles/blob/master/home/.vim/bundle_storage/statusline/doc/statusline.txt)
- [supertab](https://github.com/ervandew/supertab/blob/master/doc/supertab.txt)
- [syntastic](https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt)
- [taglist.vim](https://github.com/vim-scripts/taglist.vim/blob/master/doc/taglist.txt)
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [vim-cucumber](https://github.com/tpope/vim-cucumber)
- [vim-fugitive](https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt)
- [vim-haml](https://github.com/tpope/vim-haml)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-markdown](https://github.com/tpope/vim-markdown)
- [vim-rails](https://github.com/tpope/vim-rails/blob/master/doc/rails.txt)
- [vim-ruby](https://github.com/vim-ruby/vim-ruby/tree/master/doc)
- [vim-rvm](https://github.com/tpope/vrim-rvm)
- [vim-stylus](https://github.com/wavded/vim-stylus)
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
- [yankring](https://github.com/chrismetcalf/vim-yankring/blob/master/doc/yankring.txt)


### Additional Plug-Ins

These are the additional plug-ins included, but are not required. They are not linked to the `bundle` directory out of the box. If adding any of these, make sure to read the docs on their usage and what variables/settings may be required in `.vimrc.local`

- [autocomplpop.vim](https://github.com/vim-scripts/AutoComplPop/blob/master/doc/acp.txt) - Live completion as you type, this can slow Vim down, but is useful in certain situations
- [autocorrect.vim](https://github.com/vim-scripts/autocorrect.vim) - Corrects misspellings as you type i.e. teh -> the \*\*
- [bufkill.vim](https://github.com/vim-scripts/bufkill.vim) - Unload, delete or wipe a buffer
- [camelcasemotion](https://github.com/vim-scripts/camelcasemotion/blob/master/doc/camelcasemotion.txt) - Motion commands for moving between camelCase or words\_with\_underscores \*\*
- [clang-complete](https://github.com/Rip-Rip/clang_complet://github.com/Rip-Rip/clang_complete) - Use clang for completing C/C++ code.
- [colorsel.vim](https://github.com/vim-scripts/colorsel.vim/blob/master/doc/colorsel.txt) - Interactive RGB/HSV color selector
- [delimitMate](https://github.com/Raimondi/delimitMate) - Automatic closing of quotes, parenthesis, brackets, etc. \*\*
- [gundo](https://github.com/vim-scripts/Gundo/blob/master/doc/gundo.txt) - Graph Vim's undo tree so it is actually usable
- [html-autoclose.vim](https://github.com/vim-scripts/HTML-AutoCloseTag) - Automatically closes HTML tags, doesn't play well with the delimitMate plugin
- [indexed-search.vim](https://github.com/vim-scripts/IndexedSearch) - Adds visual cues when performing searches within a file \*\*
- [lustyjuggler](https://github.com/vim-scripts/LustyJuggler) - Enables a window for navigating through open buffers
- [tabular](https://github.com/godlygeek/tabular/blob/master/doc/Tabular.txt) - Configurable, flexible, intuitive text aligning \*\*
- [tailminusf](https://github.com/vim-scripts/TailMinusF/blob/master/doc/tailminusf.txt) - Watch the contents of a file in real time
- [vim-ragtag](https://github.com/tpope/vim-ragtag/blob/master/doc/ragtag.txt) - Ghetto XML/HTML mappings
- [vim-repeat](https://github.com/tpope/vim-repeat) - Enable repeating commands mapped to "." \*\*
- [vim-speeddating](https://github.com/tpope/vim-speeddating/blob/master/doc/speeddating.txt) - Use CTRL-A/CTRL-X to increment dates, times, and more
- [vim-surround](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt) - Delete, change, and add "surroundings" i.e. parentheses, quotes, and HTML tags \*\*

**\*\* - Recommended!**


## Snippets

By default all of the snippet files stored within `snippets_storage` are symlinked into the `snippets` directory. To see the available snippets for a given file type hit `<F5>`, a snippet is triggered using `<tab>`.

Certain file types like JavaScript have hundreds of snippets based on the native language and various libraries. This can become unmanageable pretty quickly. The solution is to breakout specific libraries into their own files. For example `javascript-jasmine.snippets` where it needs to be named as `language-library.snippets`. Since snippets are saved in the `snippets_storage` directory, you can be selective about what gets a symbolic link within the `snippets` directory.

If you are working in a project that includes jQuery, you would only have symbolic links created for `javascript.snippets`, `javascript-jasmine.snippets`, and `javascript-jquery.snippets`. Another project that uses [node.js][node], you could delete the symbolic link to `javascript-jquery.snippets` and add in `javascript-node.snippets` instead. This will give you a more manageable list of snippets to work with. By default, all snippets are included at installation, you'll want to tune these based on your needs.

To learn more about [snipmate][snipmate] and creating snippets, type `:h snipmate`

For a quick way to do this, you may want to [create a shell script](https://gist.github.com/781626) to help automate the process. You'll need to restart Vim for the snippets to take affect.


## Syntax Checkers

The configuration uses [syntastic][syntastic] quite heavily, most of it is out of the box. Buffers are checked after each save.

The JavaScript syntax checker runs [JSHint][jshint] instead of jsl which is included with [syntastic][syntastic]. The executable to [JSHint][jshint] runs on [node.js][node] and needs to be installed via [npm][npm]. Also install the custom configuration JSON file into your `$HOME` directory. Instructions for doing this are located at the [jshint-config][jshint-config] repository. This installation will make it global to your machine. If you need a specific configuration on a per project basis, just drop a `.jshintrc` file in your project directory and tweak the settings.

There is also an Objective C checker included. This uses the `gcc` and requires the `cwd` to have the `.xcodeproj` file in it.

To learn more about [syntastic][syntastic] and syntax checkers, type `:h syntastic`


## Editor Themes

Themes included with this configuration:

1. `colorblind`: Black background, super vibrant colors
- `snowblind`: White background, vibrant colors
- `cataracts`: Grey background with muted colors
- `bloodshot`: Similar to colorblind but with muted colors

In the `extras` directory are Terminal themes to match the Vim color themes.

To use the Terminal themes, install [SIMBL 0.9.7](http://www.culater.net/software/SIMBL/SIMBL.php) and save the [64 Bit Terminal Colors](http://github.com/timmfin/terminalcolours) plug-in to:

    ~/Library/Application Support/SIMBL/Plugins/


The color themes have been designed with similarities in the syntax settings. Jumping between multiple languages should be easy on the mind and the eyes. Be adventurous and mix it up once in a while.

**Most themes use the custom [MesloGM font](https://github.com/andreberg/Meslo-Font). Download, install and live the dream.**


## Tips


### FCheat

Within Vim type `:h fcheat` to view key and leader bindings for the F/ configuration


### Mouse Support For Terminal

To get full mouse support (scrolling, clicking, etc...) within Terminal Vim, install the SIMBL [MouseTerm](http://bitheap.org/mouseterm/) plug-in. It brings the goodness.


### Working With Your Own Submodules

In order to keep your personal submodules available to forks but allow commits back to the upstream master repository from within the submodule:

1. Create the repository for your bundle within git
-  Then from the `vimfiles` directory add the submodule as you would any other submodule
-  Within your newly created submodule, create a remote reference to the upstream master repository
-  Make changes to the submodule and push updates back to the remote upstream master
-  Then whenever you pull updates to all of your submodules, you as well as everyone else should get the changes

Here is an example:

    cd ~/.homesick/repos/vimfiles/
    git submodule add git://github.com/username/submodule-name.vim.git home/.vim/bundle_storage/submodule-name.vim
    cd home/.vim/bundle_storage/submodule-name.vim/
    git remote add push git@github.com:username/submodule-name.vim.git
    git submodule init
    git submodule update
    ln -s ~/path/to/vimfiles/bundle_storage/submodule-name.vim ~/path/to/vimfiles/bundle/submodule-name.vim

Then whenever you make changes to the submodule:

    cd ~/.homesick/repos/vimfiles/home/.vim/bundle_storage/submodule-name.vim/
    git push push master

This allows you to make changes directly in your submodule, see the effects and push the changes back without maintaining multiple repositories and linking them back and forth. [Defunkt][defunkt] has a good article about [working with submodules][defunkt-subs].


## License and Contributions

All licensing for the Bundles/Plug-ins should be found in their respective repositories. Anything written by F/ is of course open source through MIT. While contributions are welcome, you're probably better off forking and tuning it to your own machine.

Copyright (c) 2011 by Factory Design Labs

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.


<!-- link ids -->
[macvim]: http://code.google.com/p/macvim/
[homebrew]: http://github.com/mxcl/homebrew
[homesick]: http://github.com/technicalpickles/homesick
[node]: http://nodejs.org/
[ctags]: http://ctags.sourceforge.net/
[discount]: http://www.pell.portland.or.us/~orc/Code/discount/
[vim-scripts]: https://github.com/vim-scripts
[install.sh]: https://github.com/factorylabs/vimfiles/blob/master/install.sh
[update.sh]: https://github.com/factorylabs/vimfiles/blob/master/update.sh
[clean.sh]: https://github.com/factorylabs/vimfiles/blob/master/clean.sh
[closure]: http://code.google.com/p/closure-linter/
[jslint]: http://www.jslint.com/lint.html
[syntastic]: https://github.com/scrooloose/syntastic
[snipmate]: https://github.com/msanders/snipmate.vim
[pathogen]: https://github.com/tpope/vim-pathogen
[fmd-themes]: https://github.com/factorylabs/fmd-themes
[MesloGM]: https://github.com/andreberg/Meslo-Font
[defunkt]: http://github.com/defunkt
[defunkt-subs]: http://github.com/guides/developing-with-submodules
[node]: http://nodejs.org/
[npm]: http://npmjs.org/
[jshint]: http://jshint.com/ 
[jshint-config]: https://github.com/factorylabs/jshint-config 


# Cheat40: a cheat sheet for Vim

Cheat40 is a foldable extensible 40-column cheat sheet that you may open in Vim
by pressing `<leader>?` (the mapping is customizable, of course). Mappings and
commands are organized like the menus of a GUI app: there is a File section, an
Edit section, a View section, and so on. For each item the description comes
first, because one typically wants to find how to execute a task, not what the
meaning of a key sequence is (there is Vim's help for that). Syntax coloring and
the use of `conceal` keep the cheat sheet clutter-free and easy to read.


## Installation

If your Vim supports packages (`echo has('packages')` prints `1`), I strongly
recommend that you use them. Just clone this repo inside `pack/*/start`, e.g.,

    cd ~/.vim
    git clone https://github.com/lifepillar/vim-cheat40.git pack/bundle/start/cheat40

Otherwise, use your preferred installation method.


## Extending the cheat sheet

You may extend the cheat sheet by putting one or more files called `cheat40.txt`
anywhere in your `runtimepath` (e.g., in `~/.vim`). Cheat40 searches
`runtimepath` for such files and concatenates their content. This allows plugin
developers to provide a cheat sheet for their plugins by putting a `cheat40.txt`
file in the top folder of their plugins.

If you do not want to use the default cheat sheet that comes with this plugin,
set the following variable in your `.vimrc`:

    let g:cheat40_use_default = 0

In this case, I recommend that you copy `cheat40.txt` into your `.vim` folder
and modify it to suit your needs.

The syntax of a cheat sheet is very simple:

- foldable sections use Vim's default markers (`{{{` and `}}}`) (see `:h
  fold-marker`);
- sections of the form `About … {{{ … }}}` are interpreted as block comments;
- lines starting with a `#` are interpreted as line comments;
- each line, except for comments and section markers, should be 40 columns wide
  (comments and section markers may be shorter than that);
- each item consists of a description, a key sequence, and a label;
- the description must fit in columns 1–25 (long descriptions may be split into
  several lines);
- the key sequence and the label must fit in columns 26–40 (long key sequences
  should be split into several lines);
- the label is a right-justified sequence of one or more characters (e.g., `N`
  for Normal mode, `I` for Insert mode, and so on).

See the cheat sheet inside the plugin for the details.


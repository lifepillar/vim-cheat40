# Cheat40: a Vim cheatsheet for Vim

Cheat40 is an extensible 40-column cheat sheet that you may open in Vim by
pressing `<leader>?`. Mappings and commands are organized like the menus of
a GUI app: there is a File section, an Edit section, a View section, and so on.
For each item the description comes first, because when one typically wants to
find how to execute a task, not what the meaning of a key sequence is (there is
Vim's help for that). Syntax coloring and the use of `conceal` keep the cheat
sheet free of clutter and easy to read.


## Installation

If your Vim supports packages (`echo has('packages')` prints `1`), I strongly
recommend that you use them. Just clone this repo inside `pack/*/start`, e.g.,

    cd ~/.vim
    git clone https://github.com/lifepillar/vim-cheat40.git pack/bundle/start/cheat40

Otherwise, use your preferred installation method.


## Extending the cheat sheet

You may extend the cheat sheet by putting a file called `cheat40.txt` anywhere
in your `runtimepath` (e.g., in `~/.vim`). Cheat40 searches `runtimepath` for
such files and concatenates their content. This allows plugin developers to
provide a cheat sheet for their plugins by putting a `cheat40.txt` in the top
folder of their plugins.

The syntax is very simple:

- foldable sections use Vim's default markers (`{{{` and `}}}`);
- each line, except for section markers, must be 40 columns wide;
- a description must fit in lines 1–25 (long descriptions may be split in
  several lines);
- a mapping or a command must fit in the remaining columns;
- column 40 must contain a character that specifies the mode for the command
  (e.g., `N` for Normal mode, `I` for Insert mode, and so on);
- additional characters may be added from right to left (e.g., a mapping that
  may be executed in Normal and Insert mode may be labeled with `IN`, with the
  label starting at column 39). See the cheat sheet in the plugin for examples
  and a description of the used notation.


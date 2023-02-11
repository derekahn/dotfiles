# [LunarVim](https://www.lunarvim.org)

> I'm currently running `nightly`

## Shortcuts

These are my favorite shortcuts that I use.

### EDC

> Every Day Commands

These are just commands I've grown used to over the years from previous editors. So I customized it to work in LunarVim.

| Mappings           | Action                                  |
| ------------------ | --------------------------------------- |
| <kbd>Ctrl-b</kbd>  | Quick buffer explorer                   |
| <kbd>Ctrl-p</kbd>  | Ctrlp keybinding from sublime text days |
| <kbd>Shift-l</kbd> | Switch tab/buffer right                 |
| <kbd>Shift-h</kbd> | Switch tab/buffer left                  |
| <kbd>Shift-t</kbd> | Show color column for 80 chars          |

### [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf#usage)

| Mappings            | Action                                                |
| ------------------- | ----------------------------------------------------- |
| <kbd>leader-a</kbd> | Close quick fix pane                                  |
| <kbd>leader-;</kbd> | Open quick fix pane                                   |
| <kbd>Ctrl-t</kbd>   | In a quick fix window will open in a new tab          |
| <kbd>Ctrl-x</kbd>   | In a quick fix window will open in a horizontal split |
| <kbd>Ctrl-v</kbd>   | In a quick fix window will open in a vertical split   |

### [Comment.nvim](https://github.com/numToStr/Comment.nvim#-usage)

`Normal Mode`

| Mappings                     | Action                                                             |
| ---------------------------- | ------------------------------------------------------------------ |
| <kbd>gcc</kbd>               | Toggles the current line using linewise comment                    |
| <kbd>gbc</kbd>               | Toggles the current line using blockwise comment                   |
| <kbd>[count]gcc</kbd>        | Toggles the number of line given as a prefix-count using linewise  |
| <kbd>[count]gbc</kbd>        | Toggles the number of line given as a prefix-count using blockwise |
| <kbd>gc[count]{motion}</kbd> | (Op-pending) Toggles the region using linewise comment             |
| <kbd>gb[count]{motion}</kbd> | (Op-pending) Toggles the region using blockwise comment            |
| <kbd>gco</kbd>               | Insert comment to the next line and enters INSERT mode             |
| <kbd>gcO</kbd>               | Insert comment to the previous line and enters INSERT mode         |
| <kbd>gcA</kbd>               | Insert comment to end of the current line and enters INSERT mode   |

`Visual Mode`

| Mappings      | Action                                     |
| ------------- | ------------------------------------------ |
| <kbd>gc</kbd> | Toggles the region using linewise comment  |
| <kbd>gb</kbd> | Toggles the region using blockwise comment |

`Linewise`

| Mappings        | Action                                                     |
| --------------- | ---------------------------------------------------------- |
| <kbd>gcw</kbd>  | Toggle from the current cursor position to the next word   |
| <kbd>gc$</kbd>  | Toggle from the current cursor position to the end of line |
| <kbd>gc}</kbd>  | Toggle until the next blank line                           |
| <kbd>gc5j</kbd> | Toggle 5 lines after the current cursor position           |
| <kbd>gc8k</kbd> | Toggle 8 lines before the current cursor position          |
| <kbd>gcip</kbd> | Toggle inside of paragraph                                 |
| <kbd>gca}</kbd> | Toggle around curly brackets                               |

`Blockwise`

| Mappings        | Action                                                       |
| --------------- | ------------------------------------------------------------ |
| <kbd>gb2}</kbd> | Toggle until the 2 next blank line                           |
| <kbd>gbaf</kbd> | Toggle comment around a function (w/ LSP/treesitter support) |
| <kbd>gbac</kbd> | Toggle comment around a class (w/ LSP/treesitter support)    |

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim#keymaps)

| Mappings                           | Action                   |
| ---------------------------------- | ------------------------ |
| <kbd>Space + g + j/k</kbd>         | Jump between changes     |
| <kbd>Space + g + l</kbd>           | Git blame it             |
| <kbd>Space + g + d</kbd>           | Git quick diff it        |
| <kbd>Space + l + d</kbd>           | Jump to errors in a file |
| <kbd>:LvimToggleFormatOnSave</kbd> | Toggle format on save    |

### [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim#example-configuration)

| Mappings             | Action                                                                                 |
| -------------------- | -------------------------------------------------------------------------------------- |
| <kbd>gd</kbd>        | Goto the definition of the function/variable                                           |
| <kbd>gr</kbd>        | Quick buffer explorer of all the references of a function or variable                  |
| <kbd>ga</kbd>        | LSP Saga Code action                                                                   |
| <kbd>gf</kbd>        | LSP Saga Finder                                                                        |
| <kbd>gj</kbd>        | LSP Saga Diagnostic previous jump                                                      |
| <kbd>gk</kbd>        | LSP Saga Diagnostic next jump                                                          |
| <kbd>gp</kbd>        | LSP Saga Peek definition                                                               |
| <kbd>gR</kbd>        | LSP Saga Rename                                                                        |
| <kbd>Shift + k</kbd> | Show info about the function/variable you are "hovering"; (shift + k) to scroll dialog |

### [nvim-surround](https://github.com/kylechui/nvim-surround)

| Mappings                | Action                                                                            |
| ----------------------- | --------------------------------------------------------------------------------- |
| <kbd>cs'</kbd>          | Change surrounding char; ie. `"` to `'`                                           |
| <kbd>ds</kbd>           | Remove surrounding char                                                           |
| <kbd>ysiw}</kbd>        | Input surrounding char on word; ie. `{Hello} world!`                              |
| <kbd>cs}]</kbd>         | Change surrounding char on word; ie. `[Hello] world!`                             |
| <kbd>yssb</kbd>         | Wrap entire line in parentheses; ie. `[Hello] world!`                             |
| <kbd>dsf</kbd>          | Deletes the function call; ie. `delete(functi*on calls)`                          |
| <kbd>cst{TAG}<CR></kbd> | Change the tag; ie. `csth1<cr>`= `<b>or tag* types</b> -> <h1>or tag* types</h1>` |

### [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)

| Key                  | Action                                             |
| -------------------- | -------------------------------------------------- |
| <kbd>Escape</kbd>    | Close outline                                      |
| <kbd>Enter</kbd>     | Go to symbol location in code                      |
| <kbd>o</kbd>         | Go to symbol location in code without losing focus |
| <kbd><C-Space></kbd> | Hover current symbol                               |
| <kbd>K</kbd>         | Toggles the current symbol preview                 |
| <kbd>r</kbd>         | Rename symbol                                      |
| <kbd>a</kbd>         | Code actions                                       |
| <kbd>h</kbd>         | Unfold symbol                                      |
| <kbd>l</kbd>         | Fold symbol                                        |
| <kbd>W</kbd>         | Fold all symbols                                   |
| <kbd>E</kbd>         | Unfold all symbols                                 |
| <kbd>R</kbd>         | Reset all folding                                  |
| <kbd>?</kbd>         | Show help message                                  |

`Commands`

| Command                | Description            |
| ---------------------- | ---------------------- |
| `:SymbolsOutline`      | Toggle symbols outline |
| `:SymbolsOutlineOpen`  | Open symbols outline   |
| `:SymbolsOutlineClose` | Close symbols outline  |

### [undotree](https://github.com/mbbill/undotree)

| Mappings         | Action                                        |
| ---------------- | --------------------------------------------- |
| <kbd>j</kbd>     | Jump to next undo node                        |
| <kbd>k</kbd>     | Jump to prev undo node                        |
| <kbd>J</kbd>     | Jump to next undo node and undo to this state |
| <kbd>K</kbd>     | Jump to prev undo node and undo to this state |
| <kbd>q</kbd>     | Quit undotree                                 |
| <kbd>p</kbd>     | Jump into the undotree diff window            |
| <kbd>Enter</kbd> | Undo to this state                            |

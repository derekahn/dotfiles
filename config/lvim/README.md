# [LunarVim](https://www.lunarvim.org)

## Shortcuts

### EDC

| Mappings       | Action                                  |
| -------------- | --------------------------------------- |
| <kbd>C-b</kbd> | Quick buffer explorer                   |
| <kbd>C-p</kbd> | Ctrlp keybinding from sublime text days |
| <kbd>S-l</kbd> | Switch tab/buffer right                 |
| <kbd>S-h</kbd> | Switch tab/buffer left                  |
| <kbd>S-t</kbd> | Show color column for 80 chars          |

### Quick Fix

| Mappings            | Action               |
| ------------------- | -------------------- |
| <kbd>leader-a</kbd> | Close quick fix pane |
| <kbd>leader-;</kbd> | Open quick fix pane  |

### Comment.nvim

#### Normal Mode

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

#### Visual Mode

| Mappings      | Action                                     |
| ------------- | ------------------------------------------ |
| <kbd>gc</kbd> | Toggles the region using linewise comment  |
| <kbd>gb</kbd> | Toggles the region using blockwise comment |

#### Linewise

| Mappings        | Action                                                     |
| --------------- | ---------------------------------------------------------- |
| <kbd>gcw</kbd>  | Toggle from the current cursor position to the next word   |
| <kbd>gc$</kbd>  | Toggle from the current cursor position to the end of line |
| <kbd>gc}</kbd>  | Toggle until the next blank line                           |
| <kbd>gc5j</kbd> | Toggle 5 lines after the current cursor position           |
| <kbd>gc8k</kbd> | Toggle 8 lines before the current cursor position          |
| <kbd>gcip</kbd> | Toggle inside of paragraph                                 |
| <kbd>gca}</kbd> | Toggle around curly brackets                               |

#### Blockwise

| Mappings        | Action                                                       |
| --------------- | ------------------------------------------------------------ |
| <kbd>gb2}</kbd> | Toggle until the 2 next blank line                           |
| <kbd>gbaf</kbd> | Toggle comment around a function (w/ LSP/treesitter support) |
| <kbd>gbac</kbd> | Toggle comment around a class (w/ LSP/treesitter support)    |

### G

| Mappings       | Action                                       |
| -------------- | -------------------------------------------- |
| <kbd>g-d</kbd> | Goto the definition of the function/variable |
| <kbd>g-r</kbd> | Quick buffer explorer                        |

| `g + r` | Get The references all the occurrences of a function or variable |
| `Shift + k` | Show info about the function/variable you are "hovering"; (shift + k) to scroll dialog |
| `Space + g + j/k` | Jump between changes |
| `Space + g + l` | Git blame it |
| `Space + g + d` | Git quick diff it |
| `Space + l + d` | Jump to errors in a file |
| `:LvimToggleFormatOnSave` | Toggle format on save |

### Vim Surround

| Mappings         | Action                                                |
| ---------------- | ----------------------------------------------------- |
| <kbd>cs'</kbd>   | Change surrounding char; ie. `"` to `'`               |
| <kbd>ds</kbd>    | Remove surrounding char                               |
| <kbd>ysiw}</kbd> | Input surrounding char on word; ie. `{Hello} world!`  |
| <kbd>cs}]</kbd>  | Change surrounding char on word; ie. `[Hello] world!` |
| <kbd>yssb</kbd>  | Wrap entire line in parentheses; ie. `[Hello] world!` |

### Rust

| Mappings         | Action                                                |
| ---------------- | ----------------------------------------------------- |
| <kbd>cs'</kbd>   | change surrounding char; ie. `"` to `'`               |
| <kbd>ds</kbd>    | remove surrounding char                               |
| <kbd>ysiw}</kbd> | input surrounding char on word; ie. `{Hello} world!`  |
| <kbd>cs}]</kbd>  | change surrounding char on word; ie. `[Hello] world!` |
| <kbd>yssb</kbd>  | Wrap entire line in parentheses; ie. `[Hello] world!` |

### Symbols Outline

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

### Commands

| Command                | Description            |
| ---------------------- | ---------------------- |
| `:SymbolsOutline`      | Toggle symbols outline |
| `:SymbolsOutlineOpen`  | Open symbols outline   |
| `:SymbolsOutlineClose` | Close symbols outline  |

### Undo Tree

| Mappings         | Action                                        |
| ---------------- | --------------------------------------------- |
| <kbd>j</kbd>     | Jump to next undo node                        |
| <kbd>k</kbd>     | Jump to prev undo node                        |
| <kbd>J</kbd>     | Jump to next undo node and undo to this state |
| <kbd>K</kbd>     | Jump to prev undo node and undo to this state |
| <kbd>q</kbd>     | Quit undotree                                 |
| <kbd>p</kbd>     | Jump into the undotree diff window            |
| <kbd>Enter</kbd> | Undo to this state                            |

### Rust

| Mappings             | Action                                    |
| -------------------- | ----------------------------------------- |
| <kbd>leader-ri</kbd> | Inlay hints                               |
| <kbd>leader-rr</kbd> | Run current buffer                        |
| <kbd>leader-ra</kbd> | Show assembly                             |
| <kbd>leader-rR</kbd> | Show current runnables menu               |
| <kbd>leader-re</kbd> | Expand current macro                      |
| <kbd>leader-ro</kbd> | Open cargo.toml                           |
| <kbd>leader-rp</kbd> | Open parent module                        |
| <kbd>leader-rS</kbd> | Start a standalone rust server for buffer |

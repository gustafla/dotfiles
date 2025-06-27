## Navigation

- `]b` `[b`: Next buffer, previous buffer
- `^d`, `^u`: Scroll down, scroll up
- `<space>f`: Telescope
    - `<space>ff`: Find files
    - `<space>fb`: Find buffers
- `gd`: Go to definition
- `gD`: Go to declaration
- `:bd`: Close buffer

## IDE

- `<space>a`: Code action
- `<space>xx`: List diagnostics
- `<space>d`: Hover diagnostic
- `K`: Hover
- `^s`: Signature help

## Editing

- Surround
```
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```
- `s`: Change one character
- `cw`, `c2w`, ...: Change word

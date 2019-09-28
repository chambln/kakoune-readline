# Readline-style mappings for Kakoune

This plugin implements about 24 line-editing shortcuts in
[Kakoune](https://kakoune.org), emulating
[Readline](https://tiswww.case.edu/php/chet/readline/rltop.html) as
closely as possible. See the readline(1) man page for explanations of
what they do.

## Installation

Put a copy of or link to `readline.kak` anywhere within your
`~/.config/kak/autoload/` directory.

## Bugs and notes

  - `transpose-char` and `transpose-word` change the search register.
  - `transpose-char` and `transpose-word` traverse line breaks.
  - If the cursor is in the middle of the word,
    `delete-horizontal-space` deletes whitespace after it.
  - The `<c-u>` mapping overrides Kakoune’s default.

I chose not to include mappings for `<c-p>` and `<c-n>` since they are
used for completion by default. If you want to use tab for completion
instead, you can use the mappings below. Use `<a-tab>` to insert a
literal tab character.

    map global insert <tab> <c-n>
    map global insert <s-tab> <c-p>
    map global insert <c-p> <up>
    map global insert <c-n> <down>

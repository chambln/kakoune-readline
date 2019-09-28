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

  - `forward-word`, `backward-word`, `capitalize-word`, `transpose-char`
    and `tranpose-word` change the search register.
  - `transpose-char` and `transpose-word` traverse line breaks.
  - If the cursor is in the middle of the word,
    `delete-horizontal-space` deletes whitespace after it.
  - The `<c-u>` mapping overrides Kakoune’s default.
  - I chose not to include mappings for `<c-p>` and `<c-n>` since they
    are used for completion by default.

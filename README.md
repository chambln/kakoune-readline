# Readline mappings for Kakoune

This plugin implements about 24 line-editing shortcuts, emulating
Readline as closely as possible. See the readline(1) man page for
explanations of what they do.

# Installation

Put a copy of or link to `readline.kak` anywhere within in your
`~/.config/kak/autoload/` directory.

# Bugs and notes

  - `forward-word`, `backward-word`, `capitalize-word`, `transpose-char`
    and `tranpose-word` change the search register.
  - `transpose-char` and `transpose-word` traverse line breaks.
  - `delete-horizontal-space` deletes whitespace after the word.
  - The `<c-u>` mapping overrides Kakoune’s default.

# Readline-style mappings for Kakoune

This plugin implements many line-editing shortcuts in
[Kakoune](https://kakoune.org), emulating
[Readline](https://tiswww.case.edu/php/chet/readline/rltop.html) as
closely as possible. See the readline(1) man page for explanations of
what they do.

## Installation

### Using `plug.kak`

Suggested configuration:

``` kak
# ~/.config/kak/kakrc
plug chambln/kakoune-readline config %{
    map global insert <tab> <c-n>
    map global insert <s-tab> <c-p>
    map global insert <c-p> <up>
    map global insert <c-n> <down>
}
```

Use `<a-tab>` to insert a tab character; or omit the config clause if
you’d rather not use tab for completion.

### Manual

Put a copy of or link to `readline.kak` anywhere within your
`~/.config/kak/autoload/` directory.

## To-do

  - Implement `reverse-search-history (C-r)` and `forward-search-history
    (C-s)`.
  - Maybe respect `%opt{extra_word_chars}`?

## Bugs and notes

  - `<c-a-h>` kills two words backward if the cursor is exactly one
    character into the latter, e.g. `one two t|hree four` becomes `one
    |hree four` where `|` represents the cursor.

  - `transpose-char` and `transpose-word` change the search register.

  - `transpose-char` and `transpose-word` traverse line breaks.

  - If the cursor is in the middle of the word,
    `delete-horizontal-space` deletes whitespace after it.

  - The `<c-u>` (`unix-line-discard`) mapping overrides Kakoune’s
    default:
    
        <c-u>
            commit changes up to now as a single undo group

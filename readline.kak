# See LICENSE file for copyright and license details.

define-command -hidden readline-forward-word %{
    # Expects to be called from insert mode.
    try %{
        execute-keys '<a-;><a-/>.<ret><a-;>/[a-zA-Z0-9]+<ret><right>'
    }
}

define-command -hidden readline-backward-word %{
    # Expects to be called from insert mode.
    try %{
        execute-keys '<a-;><a-/>[A-Za-z0-9]+<ret><a-:><a-;><a-;><a-;>;'
    }
}

define-command -hidden readline-unix-word-rubout %{
    # Expects to be called from insert mode.
    try %{
        execute-keys '<a-;><a-/>\S+\s*<ret><a-;>d'
    }
}

define-command -hidden readline-transpose-chars %{
    # Expects to be called from insert mode.
    execute-keys '<a-;>;'
    try %{
        execute-keys '<a-;>s$<ret>'                   # Fail unless cursor is at line end.
        execute-keys '<left><left><a-;>d<a-;>p<end>'  # Transpose characters at line end.
    } catch %{
        execute-keys '<a-;>s^.<ret>'                  # Fail unless cursor is at line start.
        execute-keys '<a-;>d<left><a-;>P<right>'      # Move character to end of line above.
    } catch %{
        execute-keys '<left><a-;>d<a-;>p<right><right>'  # Transpose characters.
    }
}

define-command -hidden readline-transpose-words %{
    # Expects to be called from insert mode.
    try %{
        execute-keys '<a-;>s$<ret>'  # Fail unless cursor is at line end.
        execute-keys '<end>'
        readline-backward-word
        readline-transpose-words
    } catch %{
        readline-forward-word
        execute-keys -itersel '<a-;><a-?>[^A-Za-z0-9]+<ret><a-;><a-?><ret><a-;>s[A-Za-z0-9]+<ret><a-;><a-)><a-;>)<a-;><space><a-;><a-:><right>'
    } catch nop
}

map global insert <c-a> <home> -docstring beginning-of-line
map global insert <c-e> <end> -docstring end-of-line
map global insert <c-f> <right> -docstring forward-char
map global insert <c-b> <left> -docstring backward-char
map global insert <a-f> '<a-;>: readline-forward-word<ret>' -docstring forward-word
map global insert <a-b> '<a-;>: readline-backward-word<ret>' -docstring backward-word
map global insert <c-l> '<a-;>vt' -docstring clear-screen
map global insert <c-d> <del> -docstring delete-char
map global insert <c-h> <backspace> -docstring backward-delete-char
map global insert <c-q> <c-v> -docstring quoted-insert
map global insert <a-tab> '<a-;>: execute-keys <lt>tab<gt><ret>' -docstring tab-insert
map global insert <c-t> '<a-;>: readline-transpose-chars<ret>' -docstring transpose-chars
map global insert <a-t> '<a-;>: readline-transpose-words<ret>' -docstring transpose-words
map global insert <a-u> '<a-;>;<a-;>W<a-;>~<right>' -docstring upcase-word
map global insert <a-l> '<a-;>;<a-;>W<a-;>`<right>' -docstring downcase-word
map global insert <a-c> '<a-;>;<a-;>~<right><a-;>W<a-;>`<right>' -docstring capitalize-word
map global insert <c-k> '<a-;>;<a-;>Gl<a-;>"_d' -docstring kill-line
map global insert <c-u> '<a-;>;<a-;>h<a-;>Gh<a-;>"_d' -docstring unix-line-discard
map global insert <a-d> '<a-;>;<a-;>E<a-;>"_d' -docstring kill-word
map global insert <a-backspace> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
map global insert <a-c-h> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
map global insert <c-w> '<a-;>: readline-unix-word-rubout<ret>' -docstring unix-word-rubout
map global insert <a-\> '<esc><a-a><space>c' -docstring delete-horizontal-space
map global insert <c-y> '<c-r>"' -docstring yank
map global prompt <c-y> '<c-r>"' -docstring yank
map global prompt <c-g> <esc> -docstring abort
map global insert <a-#> '<a-;>: comment-line<ret><down>' -docstring insert-comment
map global normal <c-e> 'i' -docstring emacs-editing-mode
map global insert <a-ret> <esc> -docstring vi-editing-mode

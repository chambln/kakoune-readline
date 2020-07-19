# See LICENSE file for copyright and license details.

provide-module readline %{

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
        readline-forward-word
        execute-keys -itersel '<a-;><a-?>[^A-Za-z0-9]+<ret><a-;><a-?><ret><a-;>s[A-Za-z0-9]+<ret><a-;><a-)><a-;>)<a-;><space><a-;><a-:><right>'
    }

    define-command readline-enable %{
        map window insert <c-a> <home> -docstring beginning-of-line
        map window insert <c-e> <end> -docstring end-of-line
        map window insert <c-f> <right> -docstring forward-char
        map window insert <c-b> <left> -docstring backward-char
        map window insert <a-f> '<a-;>: readline-forward-word<ret>' -docstring forward-word
        map window insert <a-b> '<a-;>: readline-backward-word<ret>' -docstring backward-word
        map window insert <c-l> '<a-;>vt' -docstring clear-screen
        map window insert <c-d> <del> -docstring delete-char
        map window insert <c-h> <backspace> -docstring backward-delete-char
        map window insert <c-q> <c-v> -docstring quoted-insert
        map window insert <a-tab> '<a-;>: execute-keys <lt>tab<gt><ret>' -docstring tab-insert
        map window insert <c-t> '<a-;>: readline-transpose-chars<ret>' -docstring transpose-chars
        map window insert <a-t> '<a-;>: readline-transpose-words<ret>' -docstring transpose-words
        map window insert <a-u> '<a-;>;<a-;>W<a-;>~<right>' -docstring upcase-word
        map window insert <a-l> '<a-;>;<a-;>W<a-;>`<right>' -docstring downcase-word
        map window insert <a-c> '<a-;>;<a-;>~<right><a-;>W<a-;>`<right>' -docstring capitalize-word
        map window insert <c-k> '<a-;>;<a-;>Gl<a-;>"_d' -docstring kill-line
        map window insert <c-u> '<a-;>;<a-;>h<a-;>Gh<a-;>"_d' -docstring unix-line-discard
        map window insert <a-d> '<a-;>;<a-;>E<a-;>"_d' -docstring kill-word
        map window insert <a-backspace> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
        map window insert <a-c-h> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
        map window insert <c-w> '<a-;>: readline-unix-word-rubout<ret>' -docstring unix-word-rubout
        map window insert <a-\> '<esc><a-a><space>c' -docstring delete-horizontal-space
        map window insert <c-y> '<c-r>"' -docstring yank
        map window prompt <c-y> '<c-r>"' -docstring yank
        map window prompt <c-g> <esc> -docstring abort
        map window insert <a-#> '<a-;>: comment-line<ret><down>' -docstring insert-comment
        map window insert <a-ret> <esc> -docstring vi-editing-mode
    }

    define-command readline-disable %{
        unmap window insert <c-a> <home>
        unmap window insert <c-e> <end>
        unmap window insert <c-f> <right>
        unmap window insert <c-b> <left>
        unmap window insert <a-f> '<a-;>: readline-forward-word<ret>'
        unmap window insert <a-b> '<a-;>: readline-backward-word<ret>'
        unmap window insert <c-l> '<a-;>vt'
        unmap window insert <c-d> <del>
        unmap window insert <c-h> <backspace>
        unmap window insert <c-q> <c-v>
        unmap window insert <a-tab> '<a-;>: execute-keys <lt>tab<gt><ret>'
        unmap window insert <c-t> '<a-;>: readline-transpose-chars<ret>'
        unmap window insert <a-t> '<a-;>: readline-transpose-words<ret>'
        unmap window insert <a-u> '<a-;>;<a-;>W<a-;>~<right>'
        unmap window insert <a-l> '<a-;>;<a-;>W<a-;>`<right>'
        unmap window insert <a-c> '<a-;>;<a-;>~<right><a-;>W<a-;>`<right>'
        unmap window insert <c-k> '<a-;>;<a-;>Gl<a-;>"_d'
        unmap window insert <c-u> '<a-;>;<a-;>h<a-;>Gh<a-;>"_d'
        unmap window insert <a-d> '<a-;>;<a-;>E<a-;>"_d'
        unmap window insert <a-backspace> '<left><a-;>B<a-;>"_d'
        unmap window insert <a-c-h> '<left><a-;>B<a-;>"_d'
        unmap window insert <c-w> '<a-;>: readline-unix-word-rubout<ret>'
        unmap window insert <a-\> '<esc><a-a><space>c'
        unmap window insert <c-y> '<c-r>"'
        unmap window prompt <c-y> '<c-r>"'
        unmap window prompt <c-g> <esc>
        unmap window insert <a-#> '<a-;>: comment-line<ret><down>'
        unmap window insert <a-ret> <esc>
    }

}

require-module readline

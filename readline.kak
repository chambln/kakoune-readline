# See LICENSE file for copyright and license details.
map global insert <c-a> <home> -docstring beginning-of-line
map global insert <c-e> <end> -docstring end-of-line
map global insert <c-f> <right> -docstring forward-char
map global insert <c-b> <left> -docstring backward-char
map global insert <a-f> '<left><a-;>/[a-zA-Z0-9]<ret><left><a-;>e<right>' -docstring forward-word
map global insert <a-b> '<a-;><a-/>[a-zA-Z0-9]<ret><a-;>b<a-;>;' -docstring backward-word
map global insert <c-d> <del> -docstring delete-char
map global insert <c-h> <backspace> -docstring backward-delete-char
map global insert <a-tab> '<a-;>: execute-keys <lt>tab<gt><ret>' -docstring tab-insert
map global insert <c-t> '<left><a-;>d<a-;>p<right><right>' -docstring transpose-chars
map global insert <a-t> '<a-;><a-w><a-;><a-b><a-;><a-b><a-;>d<a-;><a-e><right><a-;>p<a-;><a-w>' -docstring transpose-words
map global insert <a-u> '<a-;>;<a-;>W<a-;>~<right>' -docstring upcase-word
map global insert <a-l> '<a-;>;<a-;>W<a-;>`<right>' -docstring downcase-word
map global insert <a-c> '<a-;>;<a-;>~<right><a-;>W<a-;>`<right>' -docstring capitalize-word
map global insert <c-k> '<a-;>;<a-;>Gl<a-;>"_d' -docstring kill-line
map global insert <c-u> '<a-;>;<a-;>h<a-;>Gh<a-;>"_d' -docstring unix-line-discard
map global insert <a-d> '<a-;>;<a-;>E<a-;>"_d' -docstring kill-word
map global insert <a-backspace> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
map global insert <a-c-h> '<left><a-;>B<a-;>"_d' -docstring backward-kill-word
map global insert <c-w> '<left><a-;><a-B><a-;>"_d' -docstring unix-word-rubout
map global insert <a-\> '<a-;>: try %{execute-keys -draft "bews |\t<lt>ret<gt>"_d"}<ret>' -docstring delete-horizontal-space
map global insert <c-y> '<c-r>"' -docstring yank
map global prompt <c-y> '<c-r>"' -docstring yank
map global prompt <c-g> <esc> -docstring abort
map global insert <a-#> '<a-;>: comment-line<ret><down>' -docstring insert-comment
map global normal <c-e> 'i' -docstring emacs-editing-mode
map global insert <a-ret> <esc> -docstring vi-editing-mode

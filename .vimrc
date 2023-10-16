set nu rnu
command! DeleteBlankLines :g/^\s*$/d
autocmd FileType yaml,yml setlocal expandtab shiftwidth=2 softtabstop=2

autocmd BufNewFile,BufRead *.toml set filetype=toml

" Rust uses Cargo.toml and Cargo.lock (both are toml files).
autocmd BufNewFile,BufRead Cargo.lock set filetype=toml

" Cargo configuration is a toml file.
autocmd BufNewFile,BufRead */.cargo/config set filetype=toml

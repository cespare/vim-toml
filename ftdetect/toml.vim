" Go dep and Rust use several TOML config files that are not named with .toml.
autocmd BufNewFile,BufRead *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml

" Support user-defined $CARGO_HOME directory
if !empty($CARGO_HOME)
    autocmd BufNewFile,BufRead $CARGO_HOME/config,$CARGO_HOME/credentials setf toml
endif

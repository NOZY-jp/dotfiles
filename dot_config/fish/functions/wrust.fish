function wrust
    set project_name (basename (pwd))
    cargo build --target x86_64-pc-windows-gnu &&
        cp target/x86_64-pc-windows-gnu/debug/$project_name.exe . &&
        exec ./$project_name.exe $argv
end

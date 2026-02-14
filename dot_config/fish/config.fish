if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source
/home/nozy/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/nozy/.local/share/pnpm"
if not string.match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


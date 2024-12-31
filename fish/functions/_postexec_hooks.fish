function _postexec_hooks --on-event fish_postexec
    set -f split_command (string split ' ' $argv)
    
    # funcsave
    # Wraps funcsave so the functions end up in my dotfiles
    # repo and get linked to where they belong automatically
    if [ "$split_command[1]" = 'funcsave' ]
        echo funcsave detected $split_command[2]
        if test -e $HOME/.config/fish/functions/$split_command[2].fish
            mv $HOME/.config/fish/functions/$split_command[2].fish $HOME/dotfiles/fish/functions/
            autolink
        end
    end

    # Add other needed hooks below
    # ...
    # ...

end

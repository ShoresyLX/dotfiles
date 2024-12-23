function _funcsave_handler --on-event fish_postexec
    set -f split_command (string split ' ' $argv)
    if [ "$split_command[1]" = 'funcsave' ]
        echo funcsave detected $split_command[2]
        if test -e $HOME/.config/fish/functions/$split_command[2].fish
            mv $HOME/.config/fish/functions/$split_command[2].fish $HOME/dotfiles/fish/functions/
            autolink
        end
    end
end

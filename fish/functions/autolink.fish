function autolink
    # Parse args
    if test -z $argv
        set -f source_dir $HOME/dotfiles/fish/functions
        set -f dest_dir $HOME/.config/fish/functions
    else if test (count $argv) -gt 2
        echo 'Error: More than 2 arguments'
        return 1
    else if test -d $argv[1]; and test -d $argv[2]
        set -f source_dir $argv[1]
        set -f dest_dir $argv[2]
    else
        echo 'Error: Please enter a valid directory'
        return 1
    end

    # Verify selection
    echo Linking from $source_dir to $dest_dir
    read -l -P '[Y/n]: ' confirm
    switch $confirm
        case '' Y y
            true
        case '*' N n
            echo Exiting
            return 1
    end
    
    # iterate over files, check if they need a link, do so
    for filepath in $source_dir/*.fish
        set -l split_path (string split '/' $filepath)
        set -l func_name $split_path[-1]
        if not test -L $dest_dir/$func_name
            echo linking $func_name
            ln -sfn $filepath $dest_dir/
        end
    end

    # Cleanup any broken symlinks if this was executed because
    # of a renaming operation
    find $dest_dir/ -xtype l -delete
end

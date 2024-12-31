function sypy --description 'Manage python environments'
    argparse --stop-nonopt h/help -- $argv
    
    if set -q _flag_help
        _sypy_help
    else if functions --query _sypy_sub_$argv[1]
        _sypy_sub_$argv[1]
    else
        _sypy_help
    end
end

function _sypy_help
    printf %s\n \
        'Usage: sypy [options] subcommand [options]' \
        '' \
        'Options:' \
        '  -h or --help     print this help message' \
        'Subcommands:' \
        '  create:          create a new python venv in the current directory' \
        '  activate:        activate the venv in the current directory' \
        '  freeze:          freeze and save the current pip dependencies to requirements.txt' \
        '  load:            install requirements.txt via pip'
end

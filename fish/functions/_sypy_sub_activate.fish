function _sypy_sub_activate
    if test -z $VIRTUAL_ENV
        source venv/bin/activate.fish
    else
        echo "There is already an active venv"
        return 0
    end
end

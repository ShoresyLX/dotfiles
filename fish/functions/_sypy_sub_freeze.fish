function _sypy_sub_freeze
    if test -z $VIRTUAL_ENV
        echo "You are not in an active venv"
        return 0
    end
    python -m pip freeze > requirements.txt
end

function _sypy_sub_load
    if test -z $VIRTUAL_ENV
        echo "You are not in an active venv"
        return 0
    end
    pip install -r requirements.txt
end

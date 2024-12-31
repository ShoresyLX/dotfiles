function _sypy_sub_create
    if test -d venv/
        echo "There is already a venv in this project"
        return 0
    end
    python -m venv venv
end

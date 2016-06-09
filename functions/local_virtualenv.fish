function local_virtualenv -d "My package" --on-variable PWD --description "auto-activate local virtualenvs"
  # Package entry-point
  echo "hey"
  if test -e (ls venv-*/bin/activate 2>/dev/null)
    if ! test -n $VIRTUAL_ENV
      export _VENV_NAME=
    end
    
    # Check to see if already activated to avoid redundant activating
    if $_VENV_NAME != (basename `pwd`)
      export _VENV_NAME=$(basename `pwd`)
      echo Activating virtualenv \"$_VENV_NAME\"...
      source ./venv-*/bin/activate
    end
  end
end

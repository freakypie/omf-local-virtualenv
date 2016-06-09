function local_virtualenv --on-variable PWD --description "auto-activate local virtualenvs"
  # Package entry-point
  if ls venv-*/bin/activate.fish >/dev/null
    if test -z $VIRTUAL_ENV
      set _VENV_NAME "" >/dev/null ^/dev/null
    end

    # Check to see if already activated to avoid redundant activating
    if test "$_VENV_NAME" != (basename (pwd))
      set _VENV_NAME (basename (pwd)) >/dev/null ^/dev/null
      echo Activating virtualenv $_VENV_NAME
      source ./venv-*/bin/activate.fish
    end
  end
end

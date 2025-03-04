  SCRIPT_DIR=~/.dotfiles

  usage() {
    if [ "$1" == "sync" ]; then
      echo "Usage: $0 sync [home|system]"
      echo "Args:"
      echo "  home      Sync home configuration"
      echo "  system    Sync system configuration"
    elif [ "$1" == "update" ]; then
      echo "Error: $0 $1 doesn't take any subcommand arguments!"
    elif [ "$1" == "upgrade" ]; then
      echo "Error: $0 $1 requires a hostname argument! Pass either 'nyx' or 'lykaon'"
    else
      echo "Usage: $0 [sync|update|upgrade] [args...]"
      echo
      echo "Options:"
      echo "  -h        Print this help message"
    fi

    return 1
  }

  while getopts "h" arg; do
    case "$arg" in
      h)
        usage
        exit 0
        ;;
      *)
        usage
        exit 1
    esac
  done
  shift $((OPTIND-1))

  if [ "$1" = "sync" ]; then
    if [ "$2" = "nyx" ] || [ "$2" = "lykaon" ]; then
      $SCRIPT_DIR/wrapper/sync.sh
      exit 0
    elif [ "$2" = "home" ] || [ "$2" = "system" ]; then
      $SCRIPT_DIR/wrapper/sync.sh "$2" "$3"
      exit 0
    else
      usage sync
      if ! usage ; then
        exit 1
      fi
    fi
  elif [ "$1" = "update" ]; then
    if [ "$#" -gt 1 ]; then
      usage update
    fi
    $SCRIPT_DIR/wrapper/update.sh
    exit 0
  elif [ "$1" = "upgrade" ]; then
    if [ "$2" = "nyx" ] || [ "$2" = "lykaon" ]; then
      $SCRIPT_DIR/wrapper/upgrade.sh "$2"
    else
      echo "Error: $0 $1 requires a hostname argument! Pass either 'nyx' or 'lykaon'"
    fi
  else
    usage
  fi

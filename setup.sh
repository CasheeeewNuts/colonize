COLONIZE_HOME="$HOME/.colonize"

function abort() {
  if [ -n "$1"  ]; then
      echo "$1"
  else
      cat
  fi

  exit 1
}

function check_git_installed() {
  if [ "$(command -v git)" ]; then
    echo 1
  fi
}

function create_home_directory() {
    if [ -d "$COLONIZE_HOME" ]; then
      :
    else
      mkdir "$COLONIZE_HOME"
    fi
}

function main() {
    create_home_directory

    if [ "$(check_git_installed)" ]; then
        :
    else
        abort "git not installed!"
    fi

    cd "$COLONIZE_HOME" || exit

    git clone "${COLONIZE_REPO:-git@github.com:CasheeeewNuts/colonize}" .

    chmod 775 ./colonize.sh
}

main

add-zsh-hook chpwd chpwd_is_terraform

chpwd_is_terraform() {
    setopt -s nullglob
    set -- *.tf
    if [ "$#" -gt 0 ]; then
        if command -v tfswitch >/dev/null 2>&1; then
            echo "Triggering auto-tfswitch"
            tfswitch
        else
            echo "[WARN] tfswitch wasn't found in your path, make sure it's installed"
        fi
    fi
}

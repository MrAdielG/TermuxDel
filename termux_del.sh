#!/data/data/com.termux/files/usr/bin/bash

mkdir -p "$HOME/.trash"

cat > "$PREFIX/bin/del" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

TRASH="$HOME/.trash"

if [ "$#" -eq 0 ]; then
    echo "Usage: del <file or folder>"
    exit 1
fi

for file in "$@"; do
    if [ -e "$file" ] || [ -L "$file" ]; then
        mv -- "$file" "$TRASH/"
    else
        echo "Not found: $file"
    fi
done
EOF

chmod +x "$PREFIX/bin/del"

echo "del cmd installed!"
echo "Be Happy!!!"
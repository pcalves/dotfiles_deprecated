for ext in $(cat vscode-exts.list); do
  echo -e "==> Install ext=$ext"
  code --install-extension $ext
done

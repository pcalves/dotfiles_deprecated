# Symlink settings

```
ln -s ~/.homesick/repos/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

# Sync/Install extensions

To get a list of the currently installed extensions to sync:
```
code --list-extensions > vscode-exts.list
```

To install extensions from list:
```
sh install-code-extensions.sh
```

Note: in order for that script to work, `code` must be installed ([[https://code.visualstudio.com/docs/setup/mac#_command-line](link))

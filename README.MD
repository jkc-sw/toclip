# Toclip

This repo holds 2 executables `toclip` and `toclip2`. They take input from
the stdin, or the arguments. And they will send the content to the clipboard.

When `SSH_TTY` is found, `toclip` will send the content to the `SSH_TTY` with
OSC52. `toclipt` will do the same, except adding a tmux wrapper so the host
session (under tmux) will get the OSC52 encoded content.

When no `SSH_TTY` is found, it assumes you are using the desktop environment.
It will use the `xclip` to send the content to the clipboard. This will also
works under WSL as well. When that is the case, it will use the windows
`clip.exe` to set the Windows clipboard.

## Install

Make sure you have `make` available.

```bash
sudo make install
```

## Uninstall

```bash
sudo make uninstall
```

# learn-claude-code-101

Install podman:

```bash
sudo apt-get install podman
podman machine init
```

Build the container:

```bash
podman build -t sandbox -f Containerfile
```

Run the container, bind-mounting to the current directory.

```bash
# --rm            delete the container on exit; nothing persists in its own layer
# -it             interactive stdin + TTY, so the shell and Claude Code's UI work
# -v "$PWD":...   the repo itself; edits inside land directly in your working tree
#                 (:Z relabels for SELinux — needed on Fedora/RHEL, ignored elsewhere)
# -v claude-config:...  named volume keeping the login and session history across runs
podman run --rm -it \
  -v "$PWD":/workspace:Z \
  -v claude-config:/root/.claude \
  sandbox
```

I have added a Pixi task to this repository that runs the above command.

```bash
pixi run sandbox
```

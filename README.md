# dotfiles

My humble dotfiles

## Linux

### Increase inotify limits

- edit `/etc/sysctl.conf`
- add `fs.inotify.max_user_watches=524288`
- reload with `sudo sysctl -p`

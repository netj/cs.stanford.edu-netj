# very simple homepage from a markdown

### Compliation

Run `./update.sh` to produce `index.html` with a datestamp from `index.md`, `HEADER.html`, and `FOOTER.html`.

### Git Hooks

If the homepage can be hosted off a git clone directly, consider putting a hook on the remote clone, such that the datestamp updates automatically upon `git push`:
```bash
ln -sfnvr git.hooks.post-update .git/hooks/
```

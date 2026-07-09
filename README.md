# aicommits

## Intro
A Docker image to run [AI Commits](https://github.com/Nutlope/aicommits) without installing Node.js on your host.

## Build
```sh
docker build --tag vlauciani/aicommits .
```
No API key is needed at build time: all configuration is provided at run time.

## Install the launcher
`bin/aic` is a thin wrapper around `docker run`. Put it in your PATH:
```sh
sudo ln -s "$(pwd)/bin/aic" /usr/local/bin/aic
```

## Configure a profile
Profiles live in `~/.config/aicommits/<name>.env`. Start from the example:
```sh
mkdir -p ~/.config/aicommits
cp aicommits.env.example ~/.config/aicommits/default.env
"${EDITOR}" ~/.config/aicommits/default.env
```
Add more files (e.g. `work.env`) to keep different keys, models or endpoints
side by side.

## Usage
From anywhere inside a git repository (any subdirectory works):
```sh
git add <files...>
aic            # uses the "default" profile
aic work       # uses ~/.config/aicommits/work.env
git push
```
The launcher mounts the repository root automatically, so you don't need to run
it from the top level, and it handles the `safe.directory` setup for you.

### Push automatically
Prefer committing and pushing in one step? Add an alias:
```sh
alias aicp='aic && git push'
```

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository: \
<a href="https://github.com/vlauciani/aicommits/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=vlauciani/aicommits" />
</a>

# Author
(c) 2026 Valentino Lauciani valentino.lauciani[at]ingv.it

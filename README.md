# aicommits

## Intro 
A docker used to run [AI Commits](https://github.com/Nutlope/aicommits) pacakge, without install Node.js on your host.


## Build container
Remeber to get your `OPENAI_KEY` here: https://platform.openai.com/account/api-keys
```sh
docker build --build-arg  OPENAI_KEY=<your_openai_key> --tag vlauciani/aicommits .
```

## Usage
Go to your repo, *stage* your files, run docker and finally *push*:
```sh
git add <files...>
docker run -it --rm -v ${HOME}/.gitconfig:/root/.gitconfig -v $(pwd):/git vlauciani/aicommits sh -c "cd /git && aicommits"
git push
```

### Tip
To semplify, create an alias in your shell; for example:
```sh
alias aic='docker run -it --rm -v ${HOME}/.gitconfig:/root/.gitconfig -v $(pwd):/git vlauciani/aicommits sh -c "cd /git && aicommits"'
```

then:
```sh
git add <files...>
aic
git push
```

### Do you get: `The current directory must be a Git repository!` ?
In case of you receive the message:
```sh
┌   aicommits
│
└  ✖ The current directory must be a Git repository!
```

you need simply run, one time, the command:
```sh
git config --global --add safe.directory /git
```

and try again.

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository: \
<a href="https://github.com/vlauciani/aicommits/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=vlauciani/aicommits" />
</a>

# Author
(c) 2024 Valentino Lauciani valentino.lauciani[at]ingv.it


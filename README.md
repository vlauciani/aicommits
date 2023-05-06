# aicommits

## Intro 
A docker used to run AI Commits:
- https://github.com/Nutlope/aicommits


## Build container
Remeber to get your **OPENAI_KEY** here: https://platform.openai.com/account/api-keys
```
docker build --build-arg  OPENAI_KEY=<your_openai_key> --tag vlauciani/aicommits .
```

## Usage
Go to your repo:
```
git add <files...>
docker run -it --rm -v ${HOME}/.gitconfig:/root/.gitconfig -v $(pwd):/git vlauciani/aicommits sh -c "cd /git && aicommits"
git push
```

### Tip
To semplify, create an alias in your shell; for example:
```
alias aic='docker run -it --rm -v ${HOME}/.gitconfig:/root/.gitconfig -v $(pwd):/git vlauciani/aicommits sh -c "cd /git && aicommits"'
```

then:
```
git add <files...>
aic
git push
```

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository: \
<a href="https://github.com/vlauciani/aicommits/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=vlauciani/aicommits" />
</a>

# Author
(c) 2023 Valentino Lauciani valentino.lauciani[at]ingv.it


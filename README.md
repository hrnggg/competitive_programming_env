# competitive_programming_env

## Usage (WIP)
build
```
docker build . -t competitive_programming_env
```

run with code-server
```
docker run -d -p 8080:8080 -u 1000:1000 -v [contest_dir]:/home/ijub/contest competitive_programming_env
```

run with cli editor (e.g. vim)
```
docker run -it -u 1000:1000 -v [contest_dir]:/home/ijub/contest -w /home/ijub/contest competitive_programming_env /bin/bash
```

## [TODO]
- code-server
    - run code-server with mounted directory
    - formatting/linting and language-server (e.g. clang-format, clangd, black, isort, etc.) does not seem to work.
- misc
    - add atcoder repo as submodule


## references
https://github.com/Hiromi-Ayase/competitive-programming-env

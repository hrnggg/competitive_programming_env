# competitive_programming_env

## Features
languages
- Python (3.10, pypy)
- C/C++ (GCC12)

## Usage
run env with code-server
```
docker-compose -f docker-compose.yml -f docker-compose.code.yml up -d && \
open http://localhost:8080
```

run env with cli
```
docker-compose run comp_env
```

cleanup env
```
docker-compose down
docker container prune
```

example of cpp
```
cd </path/to/problem>
oj login https://atcoder.jp/
oj d <problem-url>
g++ a.cpp
oj t [-S]
oj s a.cpp
```

example of python
```
...
oj t -c [-S] "python3 a.py"
...
```

## [TODO]
- code-server
    - run code-server with mounted directory
    - formatting/linting and language-server (e.g. clang-format, clangd, black, isort, etc.) does not seem to work.
    - code completion for ac-library
- vim
    - enable to install coc extensions by loading .vimrc

## references
https://github.com/Hiromi-Ayase/competitive-programming-env

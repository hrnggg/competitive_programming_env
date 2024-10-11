# competitive_programming_env

## Features
languages
- Python (3.12, pypy)
- C/C++ (GCC14)

## Usage
run env with code-server
```
docker compose -f compose.yml -f compose.code.yml up -d && \
open http://localhost:8080
```

run env with cli
```
docker compose up -d
docker compose exec app /bin/bash
```

cleanup env
```
docker compose down
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
oj s a.py -l [LANGUAGE ID]
...
```

## [TODO]
- code-server
    - code completion for ac-library
    - add settings for C/C++
- vim
    - add settings for C/C++

## References
https://github.com/Hiromi-Ayase/competitive-programming-env

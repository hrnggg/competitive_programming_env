# competitive_programming_env

## Usage
run with code-server
```
docker-compose -f docker-compose.yml -f docker-compose.code.yml up -d && \
open http://localhost:8080
```

run with cli editor (e.g. vim)
```
docker-compose run comp_env
```

## [TODO]
- code-server
    - run code-server with mounted directory
    - formatting/linting and language-server (e.g. clang-format, clangd, black, isort, etc.) does not seem to work.


## references
https://github.com/Hiromi-Ayase/competitive-programming-env

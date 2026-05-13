[![Makefile CI](https://github.com/rzuckerm/algol60-docker-image/actions/workflows/makefile.yml/badge.svg)](https://github.com/rzuckerm/algol60-docker-image/actions/workflows/makefile.yml)

# algol60-docker-image

Docker image for [Algol60 programming language](https://www.algol60.org):

- rzuckerm/algol60:`<version>-<tag>`

where:

- `<version>` is the [Algol60 version](ALGOL60_VERSION)
- `<tag>` is the current GitHub tag without the "v"

The docker image can be found [here](https://hub.docker.com/r/rzuckerm/algol60).

単純なALGOL60のみだと、標準入出力が弱いため、拡張のMarstを使用

#初回のみ
```
docker build -t mdk-aza/algol60-docker-image .
```

事前にDockerDesktopなどで、Dockerを動かせるようにして、コンテナを実行
```
docker run -d --name algol-eval-runner -v $(pwd):/work -w /work algol60-image tail -f /dev/null
```

```
# dockerコンテナ内に入る
docker exec -it algol-eval-runner /bin/sh
# コンテナ内で、ファイルを引数に.algファイルを実行。以下はassign_eval.algを実行
./run.sh src/assign_eval.alg
```

注意
Cにコンパイルして、実行しているので、Cの拡張子なしのファイルができるのですが、随時削除してください。
algolと同じファイル名のものができます。
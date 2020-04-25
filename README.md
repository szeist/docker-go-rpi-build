# docker-go-rpi-build

Docker image for building go binaries to [Raspberry Pi](https://www.raspberrypi.org/)

## Images

### Raspberri Pi 2

```sh
make build-rpi2
```

### Build go app

```sh
	docker run --name my-go-app-build go-build-rpi:rpi2 [--upx] [SRC] [DEST]
  docker cp my-go-app-build:[DEST] .
  docker rm my-go-app-build
```

#### Arguments

| Argument | Optional  | Description                                   |
| -------- | --------- | --------------------------------------------- |
| --upx    | optional  | Use [UPX](https://upx.github.io/) compression |
| [SRC]    | mandatory | Package source for `go get`                   |
| [DEST    | mandatory | Built binary path in the container            |

#### Example

An example with [keybase](https://keybase.io/):
```sh
docker run --name rpi2-keybase-build go-build-rpi:rpi2 github.com/keybase/client/go/keybase /dist/keybase
docker cp rpi2-keybase-build:/dist/keybase .
docker rm rpi2-keybase-build
```
.ONESHELL:

IMAGE_NAME=go-build-rpi

build-rpi2:
	docker build \
		--build-arg CFLAGS="-O3 -pipe -march=armv6zk -mcpu=arm1176jzf-s -mfpu=vfp" \
		-t $(IMAGE_NAME):rpi2 \
		.

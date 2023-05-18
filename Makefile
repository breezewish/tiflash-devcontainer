BUILD_TAG := breezewish/tiflash-dev:latest

.PHONY: build
build:
	docker buildx build -t ${BUILD_TAG} .

.PHONY: build-cn
build-cn:
	docker buildx build --build-arg USE_CN_MIRROR=1 -t ${BUILD_TAG} .

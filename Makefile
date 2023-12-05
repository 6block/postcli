PROJ_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PROJ_DIR := $(subst \,/,$(PROJ_DIR))
BIN_DIR ?= $(PROJ_DIR)build/

$(info $(PROJ_DIR))

export CGO_LDFLAGS := -L$(BIN_DIR)
export CGO_CFLAGS := -I$(PROJ_DIR)build/

export CGO_ENABLED := 1

build: postcli
.PHONY: build


tidy:
	go mod tidy
.PHONY: tidy


postcli:
	@echo $(BIN_DIR)
	go build -o build/postcli ./src/
.PHONY: postcli

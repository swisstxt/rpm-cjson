HOME=$(shell pwd)
VERSION=2.1.0
RELEASE=1

all: build

clean:
	rm -rf ./rpmbuild
	mkdir -p ./rpmbuild/SPECS/ ./rpmbuild/SOURCES/

download-upstream:
	./download lua-cjson-${VERSION}devel.tar.gz https://github.com/mpx/lua-cjson/archive/${VERSION}.tar.gz

build: clean download-upstream
	mkdir -p ./SPECS/ ./SOURCES/
	cp -r ./SPECS/* ./rpmbuild/SPECS/ || true
	cp -r ./SOURCES/* ./rpmbuild/SOURCES/ || true
	rpmbuild -tb "./rpmbuild/SOURCES/lua-cjson-${VERSION}devel.tar.gz" \

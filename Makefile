HOME=$(shell pwd)
VERSION=2.1.0
RELEASE=2

all: build

clean:
	rm -rf ./rpmbuild
	mkdir -p ./rpmbuild/SPECS/ ./rpmbuild/SOURCES/

download-upstream:
	./download lua-cjson-${VERSION}.tar.gz http://www.kyne.com.au/~mark/software/download/lua-cjson-${VERSION}.tar.gz

build: clean download-upstream
	mkdir -p ./SPECS/ ./SOURCES/
	cp -r ./SPECS/* ./rpmbuild/SPECS/ || true
	cp -r ./SOURCES/* ./rpmbuild/SOURCES/ || true
	rpmbuild -tb "./rpmbuild/SOURCES/lua-cjson-${VERSION}.tar.gz" \
        --define "ver ${VERSION}" \
	--define "rel ${RELEASE}" \
	--define "_topdir %(pwd)/rpmbuild" \
	--define "_builddir %{_topdir}" \
	--define "_rpmdir %{_topdir}" \
	--define "_srcrpmdir %{_topdir}" \

REPO_ROOT = $(shell git rev-parse --show-toplevel)

build:
	go build -o protobuf main.go

pull-testdata:
	$(eval TMP_DIR := $(shell mktemp -d))
	echo $(TMP_DIR)
	ls -al $(TMP_DIR)
	mkdir -p $(TMP_DIR)/protobuf-demo-protobufs
	cd $(TMP_DIR)/protobuf-demo-protobufs; \
	git init; \
	git config core.sparseCheckout true; \
	echo "testdata" >> .git/info/sparse-checkout; \
	git remote add origin https://github.com/mbtamuli/protobuf-demo-protobufs.git; \
	git fetch --depth=1 origin master; \
	git checkout master; \
	mv testdata $(REPO_ROOT)/; \
	rm -rf $(TMP_DIR)

run: build
	./protobuf person.yaml
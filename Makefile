build:
	go build -o protobuf main.go

run: build
	./protobuf
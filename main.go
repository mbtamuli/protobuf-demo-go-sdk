package main

import (
	"fmt"
	"io/ioutil"

	"github.com/ghodss/yaml"
	"github.com/mbtamuli/protobuf-demo-protobufs/pb"
	"google.golang.org/protobuf/encoding/protojson"
)

func createMessageFromYAML() error {
	yamlBytes, err := ioutil.ReadFile("testdata/person.yaml")
	if err != nil {
		return err
	}

	jsonBytes, err := yaml.YAMLToJSON(yamlBytes)
	if err != nil {
		return err
	}

	data := &pb.Person{}
	err = protojson.Unmarshal(jsonBytes, data)
	if err != nil {
		return err
	}

	fmt.Println(data)
	return nil
}

func main() {
	createMessageFromYAML()
}

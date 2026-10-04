package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Printf("Hello from Go on %s/%s\n", runtime.GOOS, runtime.GOARCH)
}

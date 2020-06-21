package main

import (
	"fmt"
	"time"
)

func main() {
	i := -1
	for {
		i++
		fmt.Println(i)
		time.Sleep(time.Second)
	}
}

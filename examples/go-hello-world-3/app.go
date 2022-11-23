package main

import (
	"fmt"
	"net/http"
	"os"
)

func index(w http.ResponseWriter, r *http.Request) {
	hostname, _ := os.Hostname()
	fmt.Fprintf(w, "Hello World from Go! %s %s \n", hostname, r.RequestURI)
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server started.")
	http.ListenAndServe(":80", nil)
}

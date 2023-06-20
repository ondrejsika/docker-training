package main

import (
	"fmt"
	"net/http"
	"os"
)

func index(w http.ResponseWriter, r *http.Request) {
	hostname, _ := os.Hostname()
	w.Header().Set("Content-Type", "text/html")
	fmt.Fprintf(w, "<center><h1>Hello World from Go! %s</h1></center>\n", hostname)
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server started.")
	http.ListenAndServe(":80", nil)
}

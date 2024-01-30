package main

import (
	"fmt"
	"log"
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
	fmt.Println("Server started on 0.0.0.0:80, see http://127.0.0.1:80")
	err := http.ListenAndServe(":80", nil)
	if err != nil {
		log.Fatalln(err)
	}
}

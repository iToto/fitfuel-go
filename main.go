package main

import (
	"fitfuel/routes"
	"flag"
	"fmt"
	"log"
	"net/http"
)

var (
	port int
)

func init() {
	flag.IntVar(&port, "port", 8080, "HTTP Server Port")
	flag.Parse()
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to the FitFuel API")
}

func main() {

	httpAddr := fmt.Sprintf(":%v", port)

	// ROUTES
	http.HandleFunc("/", rootHandler)
	http.HandleFunc("/fuel", fuel.Index)

	// START SERVER
	log.Printf("Listening to %v", httpAddr)
	log.Fatal(http.ListenAndServe(httpAddr, nil))
}

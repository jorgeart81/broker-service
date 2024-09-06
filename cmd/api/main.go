package main

import (
	"fmt"
	"log"
	"net/http"
)

const webPort = 80

type Config struct{}

func main() {
	app := Config{}

	log.Printf("Starting broker service on port %d\n", webPort)

	// define http server
	srv := &http.Server{
		Addr:    fmt.Sprintf(":%d", webPort),
		Handler: app.routes(),
	}

	// start to server
	err := srv.ListenAndServe()
	if err != nil {
		log.Panic(err)
	}

}

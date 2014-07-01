package main

import (
	"fitfuel/routes"
	"github.com/codegangsta/martini"
)

func main() {
	m := martini.Classic()
	m.Get("/", func() string {
		return "Welcome To FitFuel"
	})
	m.Get("/fuel", fuel.Index)
	m.Run()
}

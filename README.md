fitfuel-go
==========

A simple REST API that allows you to use Fitness as a resource for an application.

# Stack
* [Golang](http://golang.org/)
* PostgreSQL

# Pre-Requisites

## Go Libraries
* [Goose](https://bitbucket.org/liamstask/goose)


## How To Run
How to run the API on your local machine?

* Setup your [Go environment](http://golang.org/doc/install)
* Install goose for DB migrations:
    `$ go get bitbucket.org/liamstask/goose/cmd/goose`
* (Optional) symlink goose to /usr/local/bin
    `ln -s $GOPATH/bin/goose /usr/local/bin/.`
* Configure db/dbconf.yml for DB connection (used for goose migrations)
* Run migrations:
    `$ goose up`
* Install go dependencies (From the root of the project directory):
    `$ go get .`
* Run application:
    `$ go run main.go`
* This should start martini listening on port 3000
* Send your requests!
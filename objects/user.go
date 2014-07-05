package user


import (
    import (
    "fitfuel/routes"
    "github.com/codegangsta/martini"
    "errors"
)

var (
    ErrAlreadyExists = errors.New("user already exists")
)

type User struct {
    id          int     `json:id`
    username    string  `json: username`
    password    string  `json:password`
    email       string  `json:email`
    first_name  string  `json:first_name`
    last_name   string  `json:last_name`
    created_at  string  `json:created_at`
    updated_at  string  `json:updated_at`
    deleted_at  string  `json:deleted_at`
}

func create(*user User ) (int, err) {

}
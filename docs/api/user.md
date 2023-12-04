# User API Docs

## Contents
- [Register Account](#register-account)
- [Login](#login)
- [Logout](#logout)
- [Get Current User](#get-current-user)
- [Update User](#update-current-user)

---

## Register Account
Endpoint: ```POST``` /register

Request Body:
```json
{
    "name": "John",
    "email": "john@mail.com",
    "password": "secret",
    "confirm_password": "secret"
}
```

Response Success (200):
```json
{
    "data": {
        "role": "user",
        "name": "John",
        "email": "john@mail.com"
    }
}
```

Response Error (400):
```json
{
    "error": {
        "name": [
            "Name required"
        ],
        "email": [
            "Email is invalid"
        ],
        "password": [
            "Password minimum 8 characters"
        ],
        "confirm_password": [
            "Confirm password required",
            "Confirm password does not match"
        ]
    }
}
```

---

## Login
Endpoint: ```POST``` /login

Request Body:
```json
{
    "email": "john@mail.com",
    "password": "secret"
}
```

Response Success (201):
```json
{
    "data": {
        "role": "user",
        "name": "John",
        "email": "john@mail.com",
        "auth_token": "auth-token"
    }
}
```

Response Error (400):
```json
{
    "error": {
        "email": [
            "Email required",
            "Wrong email or passsword"
        ],
        "password": [
            "Password required"
        ]
    }
}
```

Response Error (401):
```json
{
    "error": {
        "message": "Not authorized"
    }
}
```

---

## Logout
Endpoint: ```POST``` /logout

Request Header:
```sh
Authorization: auth-token
```

Response Success (200):
```json
{
    "data": null
}
```
Response Error (401):
```json
{
    "error": {
        "message": "Not authorized"
    }
}
```

---

## Get Current User
Endpoint: ```GET``` /users/current

Request Header:
```sh
Authorization: auth-token
```

Response Success (200):
```json
{
    "data": {
        "role": "user",
        "name": "John",
        "email": "john@mail.com",
        "auth_token": "auth-token"
    }
}
```

Response Error (401):
```json
{
    "error": {
        "message": "Not authorized"
    }
}
```

---

## Update Current User
Endpoint: ```PATCH``` /users/current

Request Header:
```sh
Authorization: auth-token
```

Request Body (not all attributes required):
```json
{
    "name": "John",
    "email": "john@mail.com",
    "password": "secret",
    "confirm_password": "secret" // required for password
}
```

Response Success (200):
```json
{
    "data": {
        "role": "user",
        "name": "John",
        "email": "john@mail.com",
    }
}
```

Response Error (400):
```json
{
    "error": {
        "name": [
            "Name required"
        ],
        "email": [
            "Email is invalid"
        ],
        "password": [
            "Password minimum 8 characters"
        ],
        "confirm_password": [
            "Confirm password required",
            "Confirm password does not match"
        ]
    }
}
```

Response Error (401):
```json
{
    "error": {
        "message": "Not authorized"
    }
}
```

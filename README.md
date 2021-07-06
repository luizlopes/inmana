# Inmana

![Elixir CI](https://github.com/luizlopes/inmana/workflows/Elixir%20CI/badge.svg) 
[![Coverage Status](https://coveralls.io/repos/github/luizlopes/inmana/badge.svg?branch=main)](https://coveralls.io/github/luizlopes/inmana?branch=main)

Inmana is a Rest API for restaurants suplies management.

## Setup

### With Docker

  Just checkout project

### Without Docker

  Firstly you need install Elixir, link [here](https://elixir-lang.org/install.html) and checkout project.

  Wabanex uses PostgresSQL, you need to access [this link](https://www.postgresql.org/download/) and follow the instructions.

  Or you can run PostgresSQL on Docker with the command:
  ```
  $ docker container run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
  ```

## Running

### With Docker
  When we use docker, we have initial executed commands in Dockerfile and docker-entrypoint.sh files.

  ```
  $ docker-compose up app
  ```

### Without Docker

  * To install project dependencies
  ```
  $ mix deps.get
  ```

  * To create database and add tables
  ```
  $ mix ecto.setup
  ```

  * To start Wabanex
  ```
  $ mix phx.server
  ```

  * To run tests (optional)
  ```
  $ mix tests
  ```

## Resources

### API
* Show a Restaurant: `GET localhost:4000/api/restaurants/:id`
* Create a new Restaurant: `POST localhost:4000/api/restaurants`
  ```json
    { 
      "name": "Restaurant name",
      "email": "Restaurant admin email address"
    }
  ```
* Show a Supply: `GET localhost:4000/api/supplies/:id`
* Create a new Supply: `POST localhost:4000/api/supplies`
  ```json
    {
      "description": "manteiga",
      "expiration_date": "2021-07-10",
      "responsible": "Luiz",
      "restaurant_id": "46d4dadd-9867-46f7-b556-d34e4fe4c4c5"
    }
  ```

### Scheduler
Inmana has a schedule to notify restaurants managers by email about supplies that are going to expire.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

defmodule RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  alias Inmana.Restaurants.Create
  alias Inmana.Restaurant

  describe "show/2" do
    test "when id is valid, then return the restaurant", %{conn: conn} do
      # preparing data
      params = %{name: "Carbonara", email: "adm@carbonara.com"}

      {:ok, %Restaurant{id: id}} = Create.call(params)

      # call subject
      # References https://hexdocs.pm/phoenix/Phoenix.ConnTest.html
      response =
        conn
        |> get(Routes.restaurants_path(conn, :show, id))
        |> json_response(200)

      # assertions
      assert %{
               "id" => ^id,
               "name" => "Carbonara",
               "email" => "adm@carbonara.com"
             } = response
    end

    test "when id doesn't exist, then return status 404 (not found)", %{conn: conn} do
      id = "351455d5-6cad-46fc-8477-af6cb0e62504"

      # call subject
      # References https://hexdocs.pm/phoenix/Phoenix.ConnTest.html
      response =
        conn
        |> get(Routes.restaurants_path(conn, :show, id))
        |> json_response(404)

      # assertions
      assert %{
               "message" => "Restaurant 351455d5-6cad-46fc-8477-af6cb0e62504 not found"
             } = response
    end

    test "when id isn't an UUID4, then return status 400 (bad request)", %{conn: conn} do
      id = "351455d5"

      # call subject
      # References https://hexdocs.pm/phoenix/Phoenix.ConnTest.html
      response =
        conn
        |> get(Routes.restaurants_path(conn, :show, id))
        |> json_response(400)

      # assertions
      assert %{
               "message" => "Id is invalid"
             } = response
    end
  end
end

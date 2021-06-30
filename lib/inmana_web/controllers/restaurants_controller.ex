defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> Inmana.Restaurants.Get.call()
    |> handle_get_response(conn)
  end

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  defp handle_get_response({:ok, restaurant}, conn) do
    conn
    |> put_status(:ok)
    |> json(restaurant)
  end

  defp handle_get_response({:error, %{message: message, status: status}}, conn) do
    conn
    |> put_status(status)
    |> json(%{error: message})
  end
end

defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("show.json", %{restaurant: restaurant}) do
    restaurant
  end

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end

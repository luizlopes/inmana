defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("show.json", %{supply: supply}), do: %{supply: supply}

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created!",
      supply: supply
    }
  end
end

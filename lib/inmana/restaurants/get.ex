defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(id) do
    case Repo.get(Restaurant, id) do
      nil -> {:error, %{message: "Restaurant #{id} not found", status: :not_found}}
      restaurant -> {:ok, restaurant}
    end
  end
end

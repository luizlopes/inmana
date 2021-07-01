defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(id) do
    id
    |> validate_uuid_format()
    |> get_restaurant()
  end

  defp validate_uuid_format(uuid) do
    case Ecto.UUID.cast(uuid) do
      :error -> {:error, :invalid_uuid}
      {:ok, uuid} -> {:ok, uuid}
    end
  end

  defp get_restaurant({:ok, id}) do
    case Repo.get(Restaurant, id) do
      nil -> {:error, %{result: "Restaurant #{id} not found", status: :not_found}}
      restaurant -> {:ok, restaurant}
    end
  end

  defp get_restaurant({:error, :invalid_uuid}) do
    {:error, %{result: "Id is invalid", status: :bad_request}}
  end
end

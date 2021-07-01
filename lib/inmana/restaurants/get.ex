defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(id) do
    id
    |> validate_uuid_format()
    |> get_restaurant()
  end

  defp validate_uuid_format(uuid) do
    Ecto.UUID.cast(uuid)
    |> handle_uuid_cast
  end

  defp handle_uuid_cast({:ok, _uuid} = uuid_cast), do: uuid_cast
  defp handle_uuid_cast(:error), do: {:error, :invalid_uuid}

  defp get_restaurant({:ok, id}) do
    Repo.get(Restaurant, id)
    |> handle_get
  end

  defp get_restaurant({:error, :invalid_uuid}),
    do: {:error, %{result: "Id is invalid", status: :bad_request}}

  defp handle_get(%Restaurant{} = restaurant), do: {:ok, restaurant}
  defp handle_get(nil), do: {:error, %{result: "Restaurant not found", status: :not_found}}
end

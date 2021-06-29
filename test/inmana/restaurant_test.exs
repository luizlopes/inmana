defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@fenda.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{changes: %{email: "siri@fenda.com", name: "Siri cascudo"}, valid?: true} = result
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "Siri cascudo", email: "sirifenda.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result
      assert errors_on(result) == %{email: ["has invalid format"]}
    end
  end
end

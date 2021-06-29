defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "You are very especial banana"}
    end
  end
end

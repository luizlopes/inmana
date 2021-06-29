defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    IO.puts("FALLBACK #{inspect(result)}")

    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end

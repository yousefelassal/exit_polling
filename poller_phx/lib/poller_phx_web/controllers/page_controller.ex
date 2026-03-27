defmodule PollerPhxWeb.PageController do
  use PollerPhxWeb, :controller
  import Inertia.Controller

  def home(conn, _params) do
    param = %{name: "John Doe"}

    conn
    |> render_inertia("Home", param)

    # default render function
    # render(conn, :home)
  end
end

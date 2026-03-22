defmodule PollerPhxWeb.PageController do
  use PollerPhxWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

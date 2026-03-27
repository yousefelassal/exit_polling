defmodule PollerPhxWeb.DistrictController do
  use PollerPhxWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

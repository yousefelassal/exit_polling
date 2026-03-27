defmodule PollerPhxWeb.DistrictController do
  use PollerPhxWeb, :controller
  require Logger
  
  alias PollerDal.Districts

  def home(conn, _params) do
    districts = Districts.list_districts()
    Logger.info("Districts: #{inspect(districts)}")
    render(conn, :home, districts: districts)
  end
end

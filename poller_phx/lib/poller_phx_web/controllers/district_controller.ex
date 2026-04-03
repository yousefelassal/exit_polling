defmodule PollerPhxWeb.DistrictController do
  use PollerPhxWeb, :controller
  require Logger
  
  alias PollerDal.Districts
  alias PollerDal.Districts.District

  def home(conn, _params) do
    districts = Districts.list_districts()
    Logger.info("Districts: #{inspect(districts)}")
    render(conn, :home, districts: districts)
  end
  
  def new(conn, _params) do
    changeset = Districts.change_district(%District{})
    render(conn, :new, form: Phoenix.Component.to_form(changeset, as: :district))
  end

  def create(conn, %{"district" => district_params}) do
    case Districts.create_district(district_params) do
      {:ok, _district} ->
        conn
        |> put_flash(:info, "District created successfully.")
        |> redirect(to: ~p"/districts")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, form: Phoenix.Component.to_form(changeset, as: :district))
    end
  end
end

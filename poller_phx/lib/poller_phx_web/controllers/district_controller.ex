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
  
  def edit(conn, %{"id" => id}) do
    district = Districts.get_district!(id)
    changeset = Districts.change_district(district)
    render(conn, :edit, district: district, form: Phoenix.Component.to_form(changeset, as: :district))
  end
  
  def update(conn, %{"id" => id, "district" => district_params}) do
    district = Districts.get_district!(id)

    case Districts.update_district(district, district_params) do
      {:ok, _district} ->
        conn
        |> put_flash(:info, "District updated successfully.")
        |> redirect(to: ~p"/districts")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, district: district, form: Phoenix.Component.to_form(changeset, as: :district))
    end
  end
  
  def delete(conn, %{"id" => id}) do
    district = Districts.get_district!(id)
    {:ok, _district} = Districts.delete_district(district)

    conn
    |> put_flash(:info, "District deleted successfully.")
    |> redirect(to: ~p"/districts")
  end
end

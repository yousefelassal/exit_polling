defmodule PollerPhxWeb.DistrictHTML do
  @moduledoc """
  Templates rendered by DistrictController.

  See the `district_html` directory for all templates available.
  """
  use PollerPhxWeb, :html

  embed_templates "district_html/*"
end

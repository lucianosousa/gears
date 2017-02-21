defmodule Gears.PageController do
  use Gears.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

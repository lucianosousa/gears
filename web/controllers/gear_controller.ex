defmodule Gears.GearController do
  use Gears.Web, :controller

  alias Gears.Gear

  def index(conn, _params) do
    gears = Repo.all(Gear)
    render(conn, "index.html", gears: gears)
  end

  def new(conn, _params) do
    changeset = Gear.changeset(%Gear{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gear" => gear_params}) do
    changeset = Gear.changeset(%Gear{}, gear_params)

    case Repo.insert(changeset) do
      {:ok, _gear} ->
        conn
        |> put_flash(:info, "Gear created successfully.")
        |> redirect(to: gear_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gear = Repo.get!(Gear, id)
    render(conn, "show.html", gear: gear)
  end

  def edit(conn, %{"id" => id}) do
    gear = Repo.get!(Gear, id)
    changeset = Gear.changeset(gear)
    render(conn, "edit.html", gear: gear, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gear" => gear_params}) do
    gear = Repo.get!(Gear, id)
    changeset = Gear.changeset(gear, gear_params)

    case Repo.update(changeset) do
      {:ok, gear} ->
        conn
        |> put_flash(:info, "Gear updated successfully.")
        |> redirect(to: gear_path(conn, :show, gear))
      {:error, changeset} ->
        render(conn, "edit.html", gear: gear, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gear = Repo.get!(Gear, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gear)

    conn
    |> put_flash(:info, "Gear deleted successfully.")
    |> redirect(to: gear_path(conn, :index))
  end
end

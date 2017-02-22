defmodule Gears.EquipmentController do
  use Gears.Web, :controller

  alias Gears.Equipment

  def index(conn, _params) do
    equipments = Repo.all(Equipment)
    render(conn, "index.html", equipments: equipments)
  end

  def new(conn, _params) do
    changeset = Equipment.changeset(%Equipment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"equipment" => equipment_params}) do
    changeset = Equipment.changeset(%Equipment{}, equipment_params)

    case Repo.insert(changeset) do
      {:ok, _equipment} ->
        conn
        |> put_flash(:info, "Equipment created successfully.")
        |> redirect(to: equipment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    equipment = Repo.get!(Equipment, id)
    render(conn, "show.html", equipment: equipment)
  end

  def edit(conn, %{"id" => id}) do
    equipment = Repo.get!(Equipment, id)
    changeset = Equipment.changeset(equipment)
    render(conn, "edit.html", equipment: equipment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "equipment" => equipment_params}) do
    equipment = Repo.get!(Equipment, id)
    changeset = Equipment.changeset(equipment, equipment_params)

    case Repo.update(changeset) do
      {:ok, equipment} ->
        conn
        |> put_flash(:info, "Equipment updated successfully.")
        |> redirect(to: equipment_path(conn, :show, equipment))
      {:error, changeset} ->
        render(conn, "edit.html", equipment: equipment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    equipment = Repo.get!(Equipment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(equipment)

    conn
    |> put_flash(:info, "Equipment deleted successfully.")
    |> redirect(to: equipment_path(conn, :index))
  end
end

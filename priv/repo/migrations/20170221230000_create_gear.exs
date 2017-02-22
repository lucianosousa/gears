defmodule Gears.Repo.Migrations.CreateGear do
  use Ecto.Migration

  def change do
    create table(:gears) do
      add :name, :string
      add :brand, :string
      add :kilometers, :float
      add :equipment_id, references(:equipments)

      timestamps()
    end

  end
end

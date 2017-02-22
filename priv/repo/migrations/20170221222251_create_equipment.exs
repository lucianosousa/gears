defmodule Gears.Repo.Migrations.CreateEquipment do
  use Ecto.Migration

  def change do
    create table(:equipments) do
      add :name, :string
      add :brand, :string

      timestamps()
    end

  end
end

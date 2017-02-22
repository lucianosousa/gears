defmodule Gears.Equipment do
  use Gears.Web, :model

  schema "equipments" do
    field :name, :string
    field :brand, :string
    has_many :gears, Gears.Gear

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :brand])
    |> validate_required([:name, :brand])
  end
end

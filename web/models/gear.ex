defmodule Gears.Gear do
  use Gears.Web, :model

  schema "gears" do
    field :name, :string
    field :brand, :string
    field :kilometers, :float
    belongs_to :equipment, Gears.Equipment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :brand, :kilometers])
    |> validate_required([:name, :brand, :kilometers])
  end
end

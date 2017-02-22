defmodule Gears.GearTest do
  use Gears.ModelCase

  alias Gears.Gear

  @valid_attrs %{brand: "some content", kilometers: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gear.changeset(%Gear{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gear.changeset(%Gear{}, @invalid_attrs)
    refute changeset.valid?
  end
end

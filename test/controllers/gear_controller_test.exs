defmodule Gears.GearControllerTest do
  use Gears.ConnCase

  alias Gears.Gear
  @valid_attrs %{brand: "some content", kilometers: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gear_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing gears"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gear_path(conn, :new)
    assert html_response(conn, 200) =~ "New gear"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gear_path(conn, :create), gear: @valid_attrs
    assert redirected_to(conn) == gear_path(conn, :index)
    assert Repo.get_by(Gear, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gear_path(conn, :create), gear: @invalid_attrs
    assert html_response(conn, 200) =~ "New gear"
  end

  test "shows chosen resource", %{conn: conn} do
    gear = Repo.insert! %Gear{}
    conn = get conn, gear_path(conn, :show, gear)
    assert html_response(conn, 200) =~ "Show gear"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, gear_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gear = Repo.insert! %Gear{}
    conn = get conn, gear_path(conn, :edit, gear)
    assert html_response(conn, 200) =~ "Edit gear"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gear = Repo.insert! %Gear{}
    conn = put conn, gear_path(conn, :update, gear), gear: @valid_attrs
    assert redirected_to(conn) == gear_path(conn, :show, gear)
    assert Repo.get_by(Gear, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gear = Repo.insert! %Gear{}
    conn = put conn, gear_path(conn, :update, gear), gear: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gear"
  end

  test "deletes chosen resource", %{conn: conn} do
    gear = Repo.insert! %Gear{}
    conn = delete conn, gear_path(conn, :delete, gear)
    assert redirected_to(conn) == gear_path(conn, :index)
    refute Repo.get(Gear, gear.id)
  end
end

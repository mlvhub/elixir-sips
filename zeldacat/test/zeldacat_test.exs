defmodule ZeldacatTest do
  use ExUnit.Case
  doctest Zeldacat

  alias Zeldacat.Entity
  alias Zeldacat.HealthComponent
  alias Zeldacat.XYComponent
  alias Zeldacat.WeaponComponent

  test "something with a health component can die" do
    # Create entity, add health component, then kill it
    {:ok, entity} = Entity.init()
    assert Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50
    assert HealthComponent.alive?(entity) == true
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 0
    assert HealthComponent.alive?(entity) == false
  end

  test "something with a health component can heal" do
    # Create entity, add health component, then kill it
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50
    assert HealthComponent.alive?(entity) == true
    Entity.notify(entity, {:heal, 50})
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true
  end

  test "something with an XYComponent can move around" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, XYComponent, {50, 50})
    Entity.notify(entity, {:move, {:y, 35}})
    assert XYComponent.get_position(entity) == {50, 35}
  end

  test "something with a WeaponComponent can manage a list of weapons" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, WeaponComponent, [])
    Entity.notify(entity, {:add_weapon, "bat"})
    assert WeaponComponent.list_weapons(entity) == ["bat"]
    Entity.notify(entity, {:add_weapon, "screwdriver"})
    assert WeaponComponent.list_weapons(entity) == ["bat", "screwdriver"]
  end
end

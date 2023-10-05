defmodule Rules do
  def eat_ghost?(power_pellet_active?, touching_ghost?) do
    power_pellet_active? and touching_ghost?
  end

  def score?(touching_power_pellet?, touching_dot?) do
    touching_power_pellet? or touching_dot?
  end

  def lose?(power_pellet_active?, touching_ghost?) do
    not power_pellet_active? and touching_ghost?
  end

  def win?(has_eaten_all_dots?, power_pellet_active?, touching_ghost?) do
    not (has_eaten_all_dots? and touching_ghost?) or
      (has_eaten_all_dots? and power_pellet_active? and touching_ghost?)
  end
end

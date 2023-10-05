defmodule HighScore do
  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score) do
    scores |> Map.put(name, score)
  end

  def remove_player(scores, name) do
    scores |> Map.delete(name)
  end

  def reset_score(scores, name) do
    scores |> add_player(name)
  end

  def update_score(scores, name, score) do
    scores |> Map.update(name, score, &(&1 + score))
  end

  def get_players(scores) do
    scores |> Map.keys()
  end
end

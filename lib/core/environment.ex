defmodule Core.Environment do
  defstruct [:steps_left]

  def new() do
    %__MODULE__{steps_left: 10}
  end

  def get_observation(_environment) do
    [0.0, 0.0, 0.0]
  end

  def get_actions(_environment) do
    [nil, :move]
  end

  def is_done(environment) do
    environment.steps_left == 0
  end

  def action(environment, _action) do
    reward = Enum.random(1..10)
    {:ok, reward, update_in(environment, [Access.key!(:steps_left)], &(&1 - 1))}
  end
end

defmodule Core.Agent do
  alias Core.Environment
  defstruct total_reward: 0

  def new() do
    %__MODULE__{}
  end

  def step(agent, env) do
    observations = Environment.get_observation(env)
    action_options = Environment.get_actions(env)
    action = choose_action(action_options, observations)
    {:ok, reward, updated_env} = Environment.action(env, action)
    updated_agent = %__MODULE__{agent | total_reward: agent.total_reward + reward}
    {:ok, updated_agent, updated_env}
  end

  defp choose_action(actions, _observations) do
    Enum.random(actions)
  end
end

defmodule HelloRl do
  alias Core.Environment
  alias Core.Agent

  def run() do
    env = Environment.new()
    agent = Agent.new()
    run(env, agent)
  end

  defp run(env, agent) do
    if Environment.is_done(env) do
      IO.puts("Total reward got: #{agent.total_reward}")
    else
      {:ok, updated_agent, updated_env} = Agent.step(agent, env)
      run(updated_env, updated_agent)
    end
  end
end

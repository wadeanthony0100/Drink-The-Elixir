defmodule Drink.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
       worker(Drink.Router, [])
    ]

    opts = [strategy: :one_for_one, name: Drink.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

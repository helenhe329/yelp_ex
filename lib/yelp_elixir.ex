defmodule YelpElixir do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(YelpElixir.Client.Base, [])
    ]

    opts = [strategy: :one_for_one, name: YelpElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

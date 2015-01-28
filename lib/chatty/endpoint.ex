defmodule Chatty.Endpoint do
  use Phoenix.Endpoint, otp_app: :chatty

  plug Plug.Static,
    at: "/", from: :chatty

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_chatty_key",
    signing_salt: "sMW45/Ic",
    encryption_salt: "dhjmpET0"

  plug :router, Chatty.Router
end

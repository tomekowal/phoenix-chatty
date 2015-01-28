defmodule Chatty.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Chatty do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
  socket "/ws" do
    channel "rooms", Chatty.Channels.Rooms
  end


  # Other scopes may use custom stacks.
  # scope "/api", Chatty do
  #   pipe_through :api
  # end
end

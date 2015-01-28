defmodule Chatty.Channels.Rooms do
  use Phoenix.Channel

  def join(topic, message, socket) do
    IO.puts "JOIN #{topic}:#{message}"
    broadcast socket, "user:entered", %{username: "#{message}"}
    {:ok, socket}
  end

  def join(topic, message, socket) do
    {:error, socket, :unauthorized}
  end

  def handle_in(topic, message, socket) do
    IO.puts "HANDLE IN #{topic}"
    broadcast socket, "new:message", %{username: message["username"], content: message["content"]}
    {:ok, socket}
  end
end

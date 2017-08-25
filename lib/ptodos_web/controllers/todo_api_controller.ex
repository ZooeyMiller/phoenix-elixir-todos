defmodule PtodosWeb.TodoApiController do
  use PtodosWeb, :controller

  alias Ptodos.Todos
  alias Ptodos.Todos.Todo

  def toggle(conn, %{"id" => id}) do
    case Todos.toggle_todo(id) do
      {:ok, todo} ->
        render(conn, "toggle.json", %{state: todo.finished})
      {:error, _message} ->
        render(conn, "error.json", %{error: "hi"})
    end
  end

end

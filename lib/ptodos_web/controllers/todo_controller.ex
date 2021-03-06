defmodule PtodosWeb.TodoController do
  use PtodosWeb, :controller

  alias Ptodos.Todos
  alias Ptodos.Todos.Todo

  def index(conn, _params) do
    changeset = Todos.change_todo(%Todo{})
    todos = Todos.list_todos()
    render(conn, "index.html", todos: todos, changeset: changeset)
  end

  def create(conn, %{"todo" => todo_params} = params) do
    %{"list_id" => list_id} = todo_params
    case Todos.create_todo(todo_params, conn.assigns.user) do
      {:ok, _todo} ->
        conn
        |> redirect(to: list_path(conn, :show, list_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    changeset = Todos.change_todo(todo)
    render(conn, "edit.html", todo: todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Todos.get_todo!(id)

    case Todos.update_todo(todo, todo_params) do
      {:ok, _todo} ->
        conn
        |> put_flash(:info, "Todo updated successfully.")
        |> redirect(to: todo_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo: todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    {:ok, _todo} = Todos.delete_todo(todo)

    conn
    |> redirect(to: todo_path(conn, :index))
  end
end

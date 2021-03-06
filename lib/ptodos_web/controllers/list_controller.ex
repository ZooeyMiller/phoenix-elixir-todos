defmodule PtodosWeb.ListController do
  use PtodosWeb, :controller

  alias Ptodos.TodoLists
  alias Ptodos.TodoLists.List

  def index(conn, _params) do
    lists = TodoLists.list_lists()
    render(conn, "index.html", lists: lists)
  end

  def new(conn, _params) do
    changeset = TodoLists.change_list(%List{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"list" => list_params}) do
    case TodoLists.create_list(list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully.")
        |> redirect(to: list_path(conn, :show, list))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = TodoLists.get_list!(id)
    todos = Ptodos.Todos.get_todos_by_list(id)
    changeset = Ptodos.Todos.change_todo(%Ptodos.Todos.Todo{})

    render(conn, "show.html", list: list, todos: todos, changeset: changeset, list_id: id)
  end

  def edit(conn, %{"id" => id}) do
    list = TodoLists.get_list!(id)
    changeset = TodoLists.change_list(list)
    render(conn, "edit.html", list: list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = TodoLists.get_list!(id)

    case TodoLists.update_list(list, list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List updated successfully.")
        |> redirect(to: list_path(conn, :show, list))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", list: list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = TodoLists.get_list!(id)
    {:ok, _list} = TodoLists.delete_list(list)

    conn
    |> put_flash(:info, "List deleted successfully.")
    |> redirect(to: list_path(conn, :index))
  end
end

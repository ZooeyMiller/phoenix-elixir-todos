defmodule PtodosWeb.TodoApiView do
  use PtodosWeb, :view
  alias PtodosWeb.TodoApiView

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, TodoApiView, "todo.json")}
  end

  def render("error.json", params) do
    %{error: "hi"}
  end

  def render("toggle.json", %{state: state}) do
    %{data: state}
  end

  def render("todo.json", %{todo: todo}) do
    todo
  end
end

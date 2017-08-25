defmodule PtodosWeb.PageController do
  use PtodosWeb, :controller

  alias Ptodos.TodoLists
  alias Ptodos.Teams

  def index(conn, _params) do
    lists = TodoLists.list_lists()
    teams = Teams.list_teams()
    render(conn, "index.html", lists: lists, teams: teams)
  end
end

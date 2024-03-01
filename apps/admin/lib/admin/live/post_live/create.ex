defmodule Admin.Live.PostLive.Create do
  use Admin, :live_view

  alias Blog.Catalog
  alias Blog.Catalog.{Category, Post}

  def mount(_params, _session, socket) do
    categories = Catalog.get_latest_categories()
    changeset = Catalog.change_post(%Post{})
    form = to_form(changeset)
    {:ok, assign(socket, categories: categories, form: form)}
  end
end

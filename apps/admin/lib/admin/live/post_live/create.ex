defmodule Admin.Live.PostLive.Create do
  use Admin, :live_view
  alias Blog.Catalog.Category
  alias Blog.Catalog

  def mount(_params, _session, socket) do
    categories = Catalog.get_latest_categories()
    category_changeset = Catalog.ch
    {:ok, socket}
  end
end

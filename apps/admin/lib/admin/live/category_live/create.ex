defmodule Admin.Live.CategoryLive.Create do
  use Admin, :live_view
  alias Blog.Catalog
  alias Blog.Catalog.Category

  def mount(_params, _session, socket) do
    IO.inspect(socket)
    categories = Catalog.get_latest_categories()
    changeset = Catalog.change_category(%Category{})
    form = to_form(changeset)
    {:ok, assign(socket, categories: categories, form: form)}
  end
end

defmodule Admin.Live.CategoryLive.Create do
  use Admin, :live_view
  alias Blog.Catalog
  alias Blog.Catalog.Category
  alias Blog.Accounts

  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])
    categories = Catalog.get_latest_categories()
    changeset = Catalog.change_category(%Category{})
    check_errors = false
    form = to_form(changeset)

    {:ok,
     assign(socket,
       categories: categories,
       form: form,
       current_user: current_user,
       check_errors: check_errors
     )}
  end

  def handle_event("save", %{"category" => category_params}, socket) do
    case Catalog.create_category(category_params) do
      {:ok, _category} ->
        changeset = Catalog.change_category(%Category{})
        {:noreply, assign(socket, form: to_form(changeset), check_errors: false)}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset), check_errors: true)}
    end
  end

  def handle_event("validate", %{"category" => category_params}, socket) do
    changeset =
      %Category{}
      |> Catalog.change_category(category_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: to_form(changeset), check_errors: true)}
  end
end

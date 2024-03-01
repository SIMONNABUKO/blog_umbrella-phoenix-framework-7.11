defmodule Blog.Catalog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :active, :boolean, default: false
    field :name, :string
    belongs_to :user, Blog.Accounts.User
    has_many :posts, Blog.Catalog.Post

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
    |> unique_constraint(:name)
    |>validate_length(:name, min: 3, max: 100)
  end
end

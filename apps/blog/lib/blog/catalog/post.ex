defmodule Blog.Catalog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :active, :boolean, default: false
    field :title, :string
    field :image, :string
    field :content, :string
    field :views, :integer
    belongs_to :user, Blog.Accounts.User
    belongs_to :category, Blog.Catalog.Category

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :user_id, :category_id])
    |> validate_required([:title, :content, :user_id, :category_id])
  end
end

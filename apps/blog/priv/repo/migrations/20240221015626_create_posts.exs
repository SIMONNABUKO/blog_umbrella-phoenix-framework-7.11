defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :active, :boolean, default: true, null: false
      add :content, :string
      add :image, :string
      add :views, :integer
      add :category_id, references(:categories, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:category_id])
    create index(:posts, [:user_id])
  end
end

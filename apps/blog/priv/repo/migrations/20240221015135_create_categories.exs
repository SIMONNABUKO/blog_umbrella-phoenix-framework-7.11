defmodule Blog.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :active, :boolean, default: false, null: false

      timestamps()
    end

    create index(:categories, [:user_id])
  end
end

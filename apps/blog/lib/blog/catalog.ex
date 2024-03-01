defmodule Blog.Catalog do
  import Ecto.Query, warn: false
  alias Blog.Repo
  alias Blog.Catalog.{Category, Post}

  @doc """
  Creates a new category.
  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    category
    |> Category.changeset(attrs)
  end

  @doc """
  Retrieves all categories with associated posts in the latest order.
  """
  def get_latest_categories do
    query =
      from c in Category,
        order_by: [desc: c.inserted_at],
        preload: [:posts],
        select: c

    {:ok, Repo.all(query)}
  end

  @doc """
  Fetches a category by its ID.
  """
  def get_category!(id) do
    Repo.get!(Category, id)
  end

  @doc """
  Updates a category with the given attributes.
  """
  def update_category(category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.
  """
  def delete_category(category) do
    Repo.delete(category)
  end

  @doc """
  Creates a new post in the specified category.
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    post
    |> Post.changeset(attrs)
  end

  @doc """
  Retrieves all posts with associated categories in the latest order.
  """
  def get_latest_posts do
    query =
      from p in Post,
        order_by: [desc: p.inserted_at],
        preload: [:category],
        select: p

    {:ok, Repo.all(query)}
  end

  @doc """
  Fetches a post by its ID.
  """
  def get_post!(id) do
    Repo.get!(Post, id)
  end

  @doc """
  Updates a post with the given attributes.
  """
  def update_post(post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.
  """
  def delete_post(post) do
    Repo.delete(post)
  end
end

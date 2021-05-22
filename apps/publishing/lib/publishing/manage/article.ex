defmodule Publishing.Manage.Article do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @optional_fields ~w(preview title url blog_id)a
  @required_fields ~w()a

  schema "article" do
    field :title, :string
    field :url, :string
    field :body, :string, virtual: true
    field :preview, :string

    belongs_to :blog, Publishing.Manage.Blog, type: :binary_id

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, %{} = attrs) do
    struct
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:title, max: 255)
    |> assoc_constraint(:blog)
    |> unique_constraint(:url)
  end

  @doc """
  Prints a message relative to the first error in the `changeset`.
  """
  def get_error(%Ecto.Changeset{errors: [{:url, _reason} | _tail]}) do
    "This article has already been published!"
  end

  def get_error(_) do
    """
    A problem ocurred validating your article.<br>
    Please contact the support.
    """
  end
end

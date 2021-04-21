defmodule Blog.Repo.Migrations.CreateBlogTable do
  use Ecto.Migration

  def change do
    create table(:blog, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :fullname, :string
      add :username, :string
      add :bio, :string
      add :donate_url, :string

      timestamps()
    end
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Lb.Repo.insert!(%Lb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Create custom users for reading data and writing data
defmodule LeastPrivilege do
  @type query_result :: Ecto.Adapters.SQL.query_result()
  @moduledoc """
  Create database users with the least privileges necessary to perform their tasks.
  """

  @spec create_nonadmin_user(String.t(), String.t()) :: query_result
  defp create_nonadmin_user(user_name, password) do
    Ecto.Adapters.SQL.query!(
      Lb.Repo,
      "CREATE USER #{user_name} WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN PASSWORD #{password};"
    )
  end

  @spec grant_table_privileges(String.t(), [String.t()], [String.t()]) :: query_result
  defp grant_table_privileges(user_name, privileges, tables) do
    for table <- tables do
      for privilege <- privileges do
        Ecto.Adapters.SQL.query!(
          Lb.Repo,
          "GRANT #{privilege} ON TABLE #{table} TO #{user_name};"
        )
      end
    end
  end

  @spec grant_sequence_privileges(String.t()) :: query_result
  defp grant_sequence_privileges(user_name) do
    Ecto.Adapters.SQL.query!(
      Lb.Repo,
      "GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public to #{user_name};"
    )
  end

  @spec create_query_only_user() :: query_result
  def create_query_only_user do
    lb_query_password = "'" <> System.fetch_env!("LB_QUERY_PASSWORD") <> "'"
    user_name = "lb_query"

    create_nonadmin_user(user_name, lb_query_password)
    grant_table_privileges(user_name, ["SELECT"], ["games", "players", "scores"])
    grant_table_privileges(user_name, ["ALL PRIVILEGES"], ["schema_migrations"])
    Ecto.Adapters.SQL.query!(Lb.Repo, "GRANT pg_read_all_data TO #{user_name};")
    Ecto.Adapters.SQL.query!(Lb.Repo, "GRANT CREATE ON SCHEMA public TO #{user_name};")
  end

  @spec create_readwrite_user() :: query_result
  def create_readwrite_user do
    lb_update_password = "'" <> System.fetch_env!("LB_UPDATE_PASSWORD") <> "'"
    user_name = "lb_update"

    create_nonadmin_user(user_name, lb_update_password)

    grant_table_privileges(user_name, ["SELECT", "INSERT", "UPDATE", "DELETE"], [
      "games",
      "players",
      "scores"
    ])

    grant_table_privileges(user_name, ["ALL PRIVILEGES"], ["schema_migrations"])
    grant_sequence_privileges(user_name)
    Ecto.Adapters.SQL.query!(Lb.Repo, "GRANT pg_write_all_data TO #{user_name};")
    Ecto.Adapters.SQL.query!(Lb.Repo, "GRANT CREATE ON SCHEMA public TO #{user_name};")
  end
end

LeastPrivilege.create_query_only_user()
LeastPrivilege.create_readwrite_user()

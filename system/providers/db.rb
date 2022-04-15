Application.register_provider(:db) do
  prepare do
    require "rom"
    require "rom-sql"
  end

  start do
    connection = Sequel.connect(ENV['DATABASE_URL'], extensions: %i[pg_timestamptz])
    register("db.connection", connection)
    register("db", ROM::Configuration.new(:sql, connection))
  end
end


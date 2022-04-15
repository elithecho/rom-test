# frozen_string_literal: true

ROM::SQL.migration do
  change do
    # run 'CREATE EXTENSION "uuid-ossp"'

    create_table :tasks do
      primary_key :id
      column :name, String
      column :completed_at, DateTime

      column :created_at, DateTime
      column :updated_at, DateTime

      foreign_key :user_id, :users
    end
  end
end

class CreateSchemaGamedesk < ActiveRecord::Migration[5.2]
  def change
    execute "CREATE SCHEMA IF NOT EXISTS gamedesk"
  end
end

class AddTagsToPolicyElement < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.class.name == 'ActiveRecord::ConnectionAdapters::PostgreSQLAdapter'
      add_column :policy_elements, :tags, 'text[]'
    else
      add_column :policy_elements, :tags, :text
    end
  end
end

class AddFieldsToWorks < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :number, :string
    add_column :works, :client, :string
  end
end

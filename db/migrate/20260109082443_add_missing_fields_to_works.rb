class AddMissingFieldsToWorks < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :category, :string
    add_column :works, :featured, :boolean
    add_column :works, :position, :integer
  end
end

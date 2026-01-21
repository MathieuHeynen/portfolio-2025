class AddTechnologiesToWorks < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :technologies, :text
  end
end

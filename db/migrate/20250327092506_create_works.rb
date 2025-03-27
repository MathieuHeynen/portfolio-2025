class CreateWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end

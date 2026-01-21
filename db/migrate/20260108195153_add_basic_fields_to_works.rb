class AddBasicFieldsToWorks < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :category, :string
    add_column :works, :featured, :boolean, default: false
    add_column :works, :position, :integer
    add_column :works, :technologies, :text  # On stockera en JSON string
    add_column :works, :live_url, :string
    add_column :works, :github_url, :string
  end
end

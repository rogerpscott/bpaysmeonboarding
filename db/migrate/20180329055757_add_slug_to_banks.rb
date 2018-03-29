class AddSlugToBanks < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :slug, :string
    add_index :banks, :slug, unique: true
  end
end

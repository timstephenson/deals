class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :theme
      t.belongs_to :parent

      t.timestamps
    end
    add_index :publishers, :parent_id
  end
end

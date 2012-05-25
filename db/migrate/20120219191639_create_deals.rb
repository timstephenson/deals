class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :proposition
      t.integer :value
      t.integer :price
      t.integer :advertiser_id
      t.integer :inventory, :default => 10, :null => false
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :sold_out

      t.timestamps
    end
  end
end

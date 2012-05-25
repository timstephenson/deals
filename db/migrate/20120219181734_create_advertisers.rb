class CreateAdvertisers < ActiveRecord::Migration
  def change
    create_table :advertisers do |t|
      t.string :name
      t.belongs_to :publisher

      t.timestamps
    end
  end
end

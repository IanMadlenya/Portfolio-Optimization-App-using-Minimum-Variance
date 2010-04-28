class CreateHistoricalAssets < ActiveRecord::Migration
  def self.up
    create_table :historical_assets do |t|
      t.string :symbol, :null => false, :unique => true
      t.string :name,   :null => false, :unique => true

      t.timestamps
    end

    add_index :historical_assets, :symbol
  end

  def self.down
    drop_table :historical_assets
  end
end

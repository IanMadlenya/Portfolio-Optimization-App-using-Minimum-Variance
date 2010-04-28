class CreateAnnualReturns < ActiveRecord::Migration
  def self.up
    create_table :annual_returns do |t|
      t.integer :historical_asset_id, :null => false, :options =>
        "CONSTRAINT fk_annual_return_stocks REFERENCES historical_asset(id)"
      t.decimal :return_value, :precision => 6, :scale => 4, :null => false
      t.string  :year

      t.timestamps
    end

    add_index :annual_returns, :return_value
  end

  def self.down
    drop_table :annual_returns
  end
end

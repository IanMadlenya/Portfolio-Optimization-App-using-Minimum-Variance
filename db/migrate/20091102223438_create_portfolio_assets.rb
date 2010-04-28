class CreatePortfolioAssets < ActiveRecord::Migration
  def self.up
    create_table :portfolio_assets do |t|
      t.integer :minimal_risk_portfolio_id, :null => false, :options => "CONSTRAINT fk_portfolio_minimal_risk_portfolios REFERENCES minimal_risk_portfolios(id)"
      t.string  :symbol, :null => false, :unique => true
      t.string  :name
      t.decimal :mean_return, :precision => 6, :scale => 4
      t.decimal :variance_return, :precision => 6, :scale => 4
      t.decimal :weight_in_portfolio, :precision => 6, :scale => 4
    end

    add_index :portfolio_assets, :symbol
  end

  def self.down
    drop_table :portfolio_assets
  end
end

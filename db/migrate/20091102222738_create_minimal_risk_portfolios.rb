class CreateMinimalRiskPortfolios < ActiveRecord::Migration
  def self.up
    create_table :minimal_risk_portfolios do |t|
      t.decimal :return_level, :precision => 6, :scale => 4, :null => false, :unique => true
      t.boolean :minimum_variance_is_attainable

      t.timestamps
    end
  end

  def self.down
    drop_table :minimal_risk_portfolios
  end
end

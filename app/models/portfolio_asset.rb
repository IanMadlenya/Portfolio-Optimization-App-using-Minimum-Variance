class PortfolioAsset < ActiveRecord::Base
  
  composed_of :investment, :class_name => 'Investment',
    :mapping => [%w(name name),
    %w(symbol symbol)]
  
  belongs_to :minimal_risk_portfolio
  
  validates_uniqueness_of :symbol, :scope => :minimal_risk_portfolio_id
  validate                :mean_return_between_zero_and_one?,         :if => Proc.new { |this_asset| !this_asset.mean_return.nil? }
  validate                :variance_return_between_zero_and_one?,     :if => Proc.new { |this_asset| !this_asset.variance_return.nil? }
  validate                :weight_in_portfolio_between_zero_and_one?, :if => Proc.new { |this_asset| !this_asset.weight_in_portfolio.nil? }
  
  private
  
  def mean_return_between_zero_and_one?
    if (self.mean_return < 0.0) or (1.0 < self.mean_return)
      errors.add( :mean_return, "Given mean return level must be between 0 and 1" )
    end
  end
  
  def variance_return_between_zero_and_one?
    if (self.variance_return < 0.0) or (1.0 < self.variance_return)
      errors.add( :variance_return, "Given variance return level must be between 0 and 1" )
    end
  end
  
  def weight_in_portfolio_between_zero_and_one?
    if (self.weight_in_portfolio < 0.0) or (1.0 < self.weight_in_portfolio)
      errors.add( :weight_in_portfolio, "Given weight in portfolio must be between 0 and 1" )
    end
  end
end
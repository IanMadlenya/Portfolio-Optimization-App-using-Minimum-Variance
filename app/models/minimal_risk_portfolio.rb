require 'minimum_variance_portfolio'
require 'bigdecimal'
BigDecimal.limit(12)

class MinimalRiskPortfolio < ActiveRecord::Base

  has_many :portfolio_assets, :dependent => :destroy do

    def optimize_assets_in_portfolio( return_level )
      mean_of_returns_in_portfolio     = []
      variance_of_returns_in_portfolio = []

      assets = self
      
      raise ArgumentError, "Portfolio contains no asssets." if assets.empty? or assets.nil?
      raise ArgumentError, "Portfolio must contain at least two asssets." if assets.second.nil?
      raise ArgumentError, "The target return level must be between 0 and 1" if return_level > 1.0
      
      assets.each do |asset|
        mean_of_returns_in_portfolio     << asset.mean_return
        variance_of_returns_in_portfolio << asset.variance_return
      end

      @mvp = MinimumVariancePortfolio.new( mean_of_returns_in_portfolio, variance_of_returns_in_portfolio )
      @minimum_variance_portfolio_exists = @mvp.calculate( return_level )
      if @minimum_variance_portfolio_exists
        allocated_weights_in_portfolio = @mvp.weights

        assets.each_with_index do |asset, i|
          asset.weight_in_portfolio = allocated_weights_in_portfolio[i].round(6)
        end
      else
        assets.each do |asset|
          asset.weight_in_portfolio = nil
        end
      end
    end

    def minimum_variance_portfolio_exists?
      @minimum_variance_portfolio_exists
    end
  end

  def optimize_portfolio
    self.portfolio_assets.optimize_assets_in_portfolio( self.return_level )
  end

  def build_portfolio_by_symbols( symbols )
    symbols.each do |symbol|
      stock           = HistoricalAsset.find_by_symbol( symbol )
      investment      = Investment.new( symbol )
      portfolio_asset = PortfolioAsset.new(
        :investment      => investment,
        :mean_return     => stock.annual_returns.mean_of_returns.round(6),
        :variance_return => stock.annual_returns.variance_of_returns.round(6))
      self.portfolio_assets << portfolio_asset
    end

    self.optimize_portfolio
    self.minimum_variance_is_attainable = self.portfolio_assets.minimum_variance_portfolio_exists?
  end

  after_update :optimize_portfolio

  validates_associated :portfolio_assets
  validate             :return_level_between_zero_and_one?
  validate             :at_least_two_assets?
  validate             :sum_of_weights_equal_one?, :if => :minimum_variance_is_attainable

  private

  def return_level_between_zero_and_one?
    if (self.return_level < 0.0 ) or (1.0 < self.return_level)
      errors.add( :return_level, "Given return level must be between 0 and 1." )
    end
  end

  def at_least_two_assets?
    if self.portfolio_assets.size < 2
      errors.add( :portfolio_assets, "Portfolio must contain at least two assets." )
    end
  end

  def sum_of_weights_equal_one?
    tolerance = 0.00000001
    sum = self.portfolio_assets.inject(0.0) { |sum, portfolio_asset| sum + portfolio_asset.weight_in_portfolio }
    delta = (sum - 1).abs
    if tolerance < delta
      errors.add( :portfolio_assets, "Sum for allocated weights of assets must equal one." )
    end
  end
end

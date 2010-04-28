require 'test_helper'

class MinimalRiskPortfolioTest < ActiveSupport::TestCase
  fixtures :annual_returns, :historical_assets

  test "should give clients correct results" do
    symbols         = ['STKS','GOLD', 'TBLL'] #= post_variables[:assets]
    amount_in_cents = 100000 #= post_variables[:amount_in_cents]
    desired_return  = 0.146 #post_variables[:desired_return]
    epsilon         = 0.0000001
    
    optimal_portfolio = MinimalRiskPortfolio.new( :return_level => desired_return )
    optimal_portfolio.build_portfolio_by_symbols( symbols )
    x = optimal_portfolio.to_xml( :include => :portfolio_assets, :dasherize => false )
    1 + 0
  end
end

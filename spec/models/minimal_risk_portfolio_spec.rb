# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../spec_helper'

describe MinimalRiskPortfolio do
  before(:each) do
    @symbols         = ['STKS','GOLD','TBLL'] #= post_variables[:assets]
    @amount_in_cents = 100000 #= post_variables[:amount_in_cents]
    @desired_return  = 0.146 #post_variables[:desired_return]
    @epsilon         = 0.0000001
    
    @optimal_portfolio = MinimalRiskPortfolio.new( :return_level => @desired_return )
    @optimal_portfolio.build_portfolio_by_symbols( @symbols )
  end
  
  it "should have a name that's at least 2 characters" do
    @optimal_portfolio.should be_valid
  end
end

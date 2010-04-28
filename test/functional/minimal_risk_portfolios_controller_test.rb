require 'test_helper'

class MinimalRiskPortfoliosControllerTest < ActionController::TestCase
  fixtures :annual_returns, :historical_assets
  
  def setup
    @controller = MinimalRiskPortfoliosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
#  test "should get index" do
#    get :index
#    assert_response :success
#    #assert_not_nil assigns(:minimal_risk_portfolios)
#  end
#  
#  test "should get new" do
#    get :new
#    assert_response :success
#  end
  
  test "should create minimal_risk_portfolio" do
    post :create, :minimal_risk_portfolio => { }
    
    assert_redirected_to minimal_risk_portfolio_path(assigns(:minimal_risk_portfolio))
  end
  
#  test "should show minimal_risk_portfolio" do
#    get :show, :id => minimal_risk_portfolios(:one).to_param
#    assert_response :success
#  end
#  
#  test "should get edit" do
#    get :edit, :id => minimal_risk_portfolios(:one).to_param
#    assert_response :success
#  end
#  
#  test "should update minimal_risk_portfolio" do
#    put :update, :id => minimal_risk_portfolios(:one).to_param, :minimal_risk_portfolio => { }
#    assert_redirected_to minimal_risk_portfolio_path(assigns(:minimal_risk_portfolio))
#  end
#  
#  test "should destroy minimal_risk_portfolio" do
#    assert_difference('MinimalRiskPortfolio.count', -1) do
#      delete :destroy, :id => minimal_risk_portfolios(:one).to_param
#    end
#    
#    assert_redirected_to minimal_risk_portfolios_path
#  end
end

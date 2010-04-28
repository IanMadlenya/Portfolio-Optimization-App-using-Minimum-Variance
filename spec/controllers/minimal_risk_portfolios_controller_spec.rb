# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MinimalRiskPortfoliosController do
  
  it "should be successful" do
    get :index
    response.should be_success
  end
  
  it "should redirect to the show template" do
    post :create
    response.should be_success
  end
end

class MinimalRiskPortfoliosController < ApplicationController
  # GET /minimal_risk_portfolios
  # GET /minimal_risk_portfolios.xml
  def index
    render :text => "The index action is not implemented as of yet!"
    #    @minimal_risk_portfolios = MinimalRiskPortfolio.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @minimal_risk_portfolios }
    #    end
  end

  # GET /minimal_risk_portfolios/1
  # GET /minimal_risk_portfolios/1.xml
  def show
    render :text => "The show action is not implemented as of yet!"
    #    @minimal_risk_portfolio = MinimalRiskPortfolio.find(params[:id])
    #
    #    respond_to do |format|
    #      format.html # show.html.erb
    #      format.xml  { render :xml => @minimal_risk_portfolio }
    #    end
  end

  # GET /minimal_risk_portfolios/new
  # GET /minimal_risk_portfolios/new.xml
  def new
    render :text => "The new action is not implemented as of yet!"
    #    @minimal_risk_portfolio = MinimalRiskPortfolio.new
    #
    #    respond_to do |format|
    #      format.html # new.html.erb
    #      format.xml  { render :xml => @minimal_risk_portfolio }
    #    end
  end

  # GET /minimal_risk_portfolios/1/edit
  def edit
    render :text => "The edit action is not implemented as of yet!"
    #    @minimal_risk_portfolio = MinimalRiskPortfolio.find(params[:id])
  end

  # POST /minimal_risk_portfolios
  # POST /minimal_risk_portfolios.xml
  def create
    post_variables   = params[:data]
    @symbols         = post_variables[:asset]
    @amount_in_cents = post_variables[:amount]
    @desired_return  = post_variables[:return_level] / 100
    @epsilon         = 0.0000001
    
	# @symbols         = ['STKS','GOLD','TBLL'] #= post_variables[:assets]
    # @amount_in_cents = 100000 #= post_variables[:amount_in_cents]
    # @desired_return  = 0.146 #post_variables[:desired_return]
    # @epsilon         = 0.0000001
	
    @optimal_portfolio = MinimalRiskPortfolio.new( :return_level => @desired_return )
    @optimal_portfolio.build_portfolio_by_symbols( @symbols )

    respond_to do |format|
      format.html { render :xml => @optimal_portfolio.to_xml( :include => :portfolio_assets, :dasherize => false ) }
      format.json { render :json => @optimal_portfolio.to_json( :include => :portfolio_assets ) }
      format.xml { render :xml => @optimal_portfolio.to_xml( :include => :portfolio_assets, :dasherize => false ) }
    end
  end

  # PUT /minimal_risk_portfolios/1
  # PUT /minimal_risk_portfolios/1.xml
  def update
    render :text => "The update action is not implemented as of yet!"
    #    @minimal_risk_portfolio = MinimalRiskPortfolio.find(params[:id])
    #
    #    respond_to do |format|
    #      if @minimal_risk_portfolio.update_attributes(params[:minimal_risk_portfolio])
    #        flash[:notice] = 'MinimalRiskPortfolio was successfully updated.'
    #        format.html { redirect_to(@minimal_risk_portfolio) }
    #        format.xml  { head :ok }
    #      else
    #        format.html { render :action => "edit" }
    #        format.xml  { render :xml => @minimal_risk_portfolio.errors, :status => :unprocessable_entity }
    #      end
    #    end
  end

  # DELETE /minimal_risk_portfolios/1
  # DELETE /minimal_risk_portfolios/1.xml
  def destroy
    render :text => "The destroy action is not implemented as of yet!"
    #    @minimal_risk_portfolio = MinimalRiskPortfolio.find(params[:id])
    #    @minimal_risk_portfolio.destroy
    #
    #    respond_to do |format|
    #      format.html { redirect_to(minimal_risk_portfolios_url) }
    #      format.xml  { head :ok }
    #    end
  end
end

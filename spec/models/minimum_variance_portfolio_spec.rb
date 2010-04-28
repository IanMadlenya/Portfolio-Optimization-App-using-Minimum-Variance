# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../spec_helper'

describe MinimumVariancePortfolio do
 
  it "should give results relatively close to the given textbook example" do

    # Introduction to Mathematical Programming Applications and Algorithms 2nd Ed
    # Wayne L. Winston
    # Duxbury Press 1995
    #
    # Example 33 pages 734-735
    #
    # An investor can invest in three assets with expected returns and variances as specified in the following table.
    # t Asset E[r]  st.dev.(r)
    # 1       10.0%   0.20
    # 2       11.5%   0.10
    # 3        8.0%   0.15
    # The three assets are independent (uncorrelated).
    #
    # 1. What are the weights of the minimum variance portfolio with mean 9%?
    #
    # Solution: allocacted weight to each asset
    #     Asset 1 Asset 2 Asset 3
    # w = 0.21277 0.19149 0.59574

		means = [0.10, 0.11, 0.08]
		variances = [0.20, 0.10, 0.15]
		desired_return = 0.09

		actual_results = [0.21277, 0.19149, 0.59574]
		delta = 0.00001 # allowable margin of error

		@portfolio1 = MinimumVariancePortfolio.new( means, variances )
		@portfolio1.calculate( desired_return )
    weights = @portfolio1.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end
	end

	it "should give results relatively close to the given textbook example" do

    # Financial Numerical Recipes in C++
    # Bernt Arne Ødegaard
    # book can be found at http:#finance.bi.no/~bernt/gcc_prog/recipes/recipes.pdf
    #
    # Example problem pages 66-67
    #
    # I have 1000 to invest in three stocks. Let Si be the random variable representing
    # the annual return on 1 invested in stock i. Thus, if Si = 0.12, 1 invested in stock
    # i at the beginning of a year was worth 1.12 at the end of the year. We are given the
    # following information: E(S1) = 0.14, E(S2) = 0.11, E(S3) = 0.10, var S1 = 0.20,
    # var S2 = 0.08, var S3 = 0.18. Formulate a solution that can be used to find the portfolio
    # that attains an expected annual returnof at least 12% and minimizes the variance of the
    # annual dollar return on the portfolio.
    #
    # Solution:
    # x1 = 380.95, x2 = 476.19, x3 = 142.86
    # The standard deviation is 274.30

		means = [0.14, 0.11, 0.10]
		variances = [0.20, 0.08, 0.18]
		desired_return = 0.12

		actual_results = [0.38095, 0.47619, 0.14286]
		delta = 0.0015 # allowable margin of error

		@portfolio2 = MinimumVariancePortfolio.new( means, variances )
		@portfolio2.calculate( desired_return )
		weights = @portfolio2.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end
  end

	it "should give results relatively close to the given textbook example" do

    # Mathematics for Finance: An Introduction to Financial Engineering
    # Capinski, Marek
    # Springer undergraduate mathematics series
    #
    # Example 5.10 pages 110-111
    #
    # (3 securities) Consider three securities with expected returns, standard deviations
    # of returns
    # µ1 = 0.10, s1 = 0.28 -> var1 = s1^2 = 0.28^2 = 0.0784
    # µ2 = 0.15, s2 = 0.24 -> var1 = s1^2 = 0.24^2 = 0.0576
    # µ3 = 0.20, s3 = 0.25 -> var1 = s1^2 = 0.25^2 = 0.0625
    #
    # Solution:
    # asset allocation weights = [0.316 0.439 0.245]
    #
    # The expected return and standard deviation of this portfolio are
    # µ = 0.146, sV = 0.162.

		means = [0.10, 0.15, 0.20]
		variances = [0.0784, 0.0576, 0.0625]
		desired_return = 0.146

		actual_results = [0.316, 0.439, 0.245]
		delta = 0.0565 # allowable margin of error

		@portfolio3 = MinimumVariancePortfolio.new( means, variances )
		@portfolio3.calculate( desired_return )
    weights = @portfolio3.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end
  end

	it "should give results relatively close to the given textbook example" do

    # Portfolio Theory & Investment Management
    # Richard Dobbins & Stephan F. Witt
    # published 1983
    #
    # Two-asset Example
    # pages 32-34
    #
    # The securities of companies A and B have the following expected returns and
    # standard deviations of returns.
    #
    #              µ(%)   s(%)
    # -----------------------
    # Company A	 10    15
    # Company A	  8    12
    #
    # In addition the expected correlation of returns between the two stocks is 0.20.
    # The expected return and risk for a set of portfolios is calculated from equations (2.7)
    # and (2.11) as follows:
    #
    # E(R) is expected return and V(R) is variance of portfolio
    #
    # (1) 100% in A
    #     E(R)=0.10
    #     V(R)=(0.15)^2=0.0225.
    #
    # (2) 100% in B
    #     E(R)=0.08
    #     V(R)=(0.12)^2=0.0144.
    #
    # (3) 80% in A, 20% in B
    #     E(R)=0.096
    #     V(R)=0.0161.
    #
    # (4) 20% in A, 80% in B
    #     E(R)=0.084
    #     V(R)=0.0113.
    #
    # (5) 60% in A, 40% in B
    #     E(R)=0.092
    #     V(R)=0.0121.
    #
    # (6) 40% in A, 60% in B
    #     E(R)=0.088
    #     V(R)=0.0105.
    #
    # (7) 50% in A, 50% in B
    #     E(R)=0.09
    #     V(R)=0.0110.

		means = [0.10, 0.08]
		variances = [0.15**2, 0.12**2]

		delta = 0.000000001 # allowable margin of error

		#(1)
		@portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.10 )
		actual_results = [1.0, 0.0]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(2)
		@portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.08 )
		actual_results = [0.0, 1.0]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(3)
    @portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.096 )
    actual_results = [0.8, 0.2]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(4)
    @portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.084 )
    actual_results = [0.2, 0.8]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(5)
    @portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.092 )
    actual_results = [0.6, 0.4]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(6)
    @portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.088 )
    actual_results = [0.4, 0.6]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end

    #(7)
    @portfolio4 = MinimumVariancePortfolio.new( means, variances )
		@portfolio4.calculate( 0.09 )
    actual_results = [0.5, 0.5]
    weights = @portfolio4.weights

		weights.each_with_index do |weight, i|
			weight.should be_close( actual_results[i], delta )
    end
  end
end


class HistoricalAsset < ActiveRecord::Base

  composed_of :investment, :class_name => 'Investment',
    :mapping => [%w(name name),
    %w(symbol symbol)]

  has_many :annual_returns, :dependent => :destroy do

    def mean_of_returns
      if @returns.nil?
        @returns = find(:all, :select => "return_value")
        @returns = @returns.collect { |return_by_year| return_by_year.return_value }
      end
      Statistics.mean( @returns )
    end

    def variance_of_returns
      if @returns.nil?
        @returns = find(:all, :select => "return_value")
        @returns = @returns.collect { |return_by_year| return_by_year.return_value }
      end
      Statistics.variance( @returns, Statistics.mean( @returns ) )
    end
  end
end
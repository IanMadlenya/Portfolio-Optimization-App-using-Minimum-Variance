class Statistics

 def self.mean( data )
    raise ArgumentError, "Wrong Arguments Given" unless data.instance_of? Array
    raise ArgumentError, "No data" if data.empty?

    sum = data.inject(0.0) { |sum, x| sum + x }
    sum / data.size
  end

  def self.sum_of_differences( data, power, mean )
    raise ArgumentError, "Wrong Arguments Given" unless data.instance_of? Array
    raise ArgumentError, "No data" if data.empty?

    sum_of_diff = data.inject(0.0) { |sum, x| sum + (x - mean)**power }
    return sum_of_diff
  end

  def self.variance( data, mean )
    raise ArgumentError, "Wrong Arguments Given" unless data.instance_of? Array
    raise ArgumentError, "No data" if data.empty?

    var = self.sum_of_differences( data, 2, mean ) / (data.size-1)
    return var
  end
end
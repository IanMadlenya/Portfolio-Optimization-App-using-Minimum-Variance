class Investment
  NAME_MAP = {
    "STKS"  => "Stocks",
    "GOLD"  => "Gold",
    "TBLL"  => "T-Bills"
  }
  attr_reader :name, :symbol

  def initialize( symbol )
    @symbol = symbol
    @name   = NAME_MAP[symbol]
  end
end
def stock_picker stock_prices
  all_profits = Hash.new
  stock_prices.each_with_index do |price, index| 
    remaining_prices = stock_prices.slice(index + 1, stock_prices.length).compact
    profit = remaining_prices.reduce(Hash.new(0)) do |acc, next_price|
      acc[next_price - price] = [price, next_price]
      acc
    end
    all_profits.merge! profit
  end
  max_profit = all_profits[all_profits.keys.max]
  max_profit.map {|profit| stock_prices.find_index profit} 
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
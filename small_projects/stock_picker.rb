# stock picker 

def stock_picker(prices)
  max_diff = 0
  stock_buy_sell = []
  for elem in prices do
    for nelem in prices[(prices.index(elem)+1)..prices.size] do
      if nelem - elem > max_diff
        max_diff = nelem - elem
        stock_buy_sell = [prices.index(elem), prices.index(nelem)]
      end
    end
  end
  stock_buy_sell.inspect
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
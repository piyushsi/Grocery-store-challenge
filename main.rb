#gem install terminal-table
require "terminal-table"

#method 
def calculatePrice
  rows = [] 
  rows << ['Milk', 1]
  rows << ['Apple', 2]
  rows << ['Bread', 3]
  rows << ['Banana', 3]
  table = Terminal::Table.new :rows => rows
  allProductsCode = ["1","2","3","4"]
  puts " Product  Code \n    ▽      ▽"
  puts table
  puts "Please enter all the purchased Product code separated by a comma"
  puts "e.g. 2 Milk and 1 apple and 1 bread \n Input > 1,1,2,3"
  allProducts = gets.chomp
  allProductsArray = allProducts.gsub(" ", "").split(",")
  
  #Validate Items
  for item in allProductsArray
    if allProductsCode.include?(item)
      next
    else
      puts "Invalid Code, please recheck the items code"
      return
    end
  end


  # allPrice =  allProductsArray.map { 
  #   |n| 
  #   n.to_i * priceList[n]
  #  }23

  puts "hi"
  priceList = { "1" => 3.97, "2" => 0.89, "3" => 2.17, "4" => 0.99,"11" => 5.00, "333"=> 6.00 }

  # allPrice =  allProductsArray.map { 
  #   |n| 
  #   n.to_i * priceList[n]
  #  }
  #  sum = 0
  #  allPrice.each { |a| sum+=a }
  #  puts sum 
end
  
#method call
calculatePrice
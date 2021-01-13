#gem install terminal-table
require "terminal-table"

#method 
def calculatePrice
  allProductsCode = ["milk","apple","bread","banana"]
  puts "Please enter all the items purchased separated by a comma"
  
  allProducts = gets.chomp
  allProductsArray = allProducts.gsub(" ", "").split(",")
  
  #Validate Items
  for item in allProductsArray
    if allProductsCode.include?(item)
      next
    else
      puts "Invalid item, please recheck the items"
      return
    end
  end


  priceList = { "milk" => 3.97, "apple" => 0.89, "bread" => 2.17, "banana" => 0.99,"2milk" => 5.00, "3bread"=> 6.00 }
  newHash = Hash.new(0)
  
  # iterate over the array, counting duplicate entries
  allProductsArray.each do |v|
    newHash[v] += 1
  end

  sum = 0
  newHash.each do |k, v|
    sum+=priceList[k]*v
  end
  
    newHash["2milk"]= newHash['milk']/2
    newHash["milk"]= newHash['milk']%2
    newHash["3bread"]= newHash['bread']/3
    newHash["bread"]= newHash['bread']%3

    rows = [] 
    rows << ['Milk', newHash['milk']+2*newHash['2milk'],"$#{priceList["milk"]*newHash['milk']+priceList['2milk']*newHash['2milk']}"]
    rows << ['Bread', newHash['bread']+3*newHash['3bread'],"$#{priceList["bread"]*newHash['bread']+priceList['3bread']*newHash['3bread']}"]
    rows << ['Apple', newHash['apple'],"$#{priceList["apple"]*newHash['apple']}"]
    rows << ['Banana', newHash['banana'],"$#{priceList["banana"]*newHash['banana']}"]
    table = Terminal::Table.new :rows => rows
    puts "\nItem  Quantity Price"
    puts table

  offerSum = 0
  newHash.each do |k, v|
    offerSum+=priceList[k]*v
  end
  save = sum-offerSum
  puts "\nTotal price : $#{offerSum.round(2)}"
  puts "You saved $#{save.round(2)} today."
end
  
#method call
calculatePrice
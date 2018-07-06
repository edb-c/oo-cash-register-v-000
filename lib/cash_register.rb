=begin
CashRegister
  ::new
    sets an instance variable @total on initialization to zero 
    optionally takes an employee discount on initialization 
  #total
    returns the current total 
  #add_item
    accepts a title and a price and increases the total 
    also accepts an optional quantity 
    doesn't forget about the previous total 
  #apply_discount
    the cash register was initialized with an employee discount
      applies the discount to the total price 
      returns success message with updated total 
      reduces the total 
    the cash register was not initialized with an employee discount
      returns a string error message that there is no discount to apply 
  #items
    returns an array containing all items that have been added (
  #void_last_transaction
    subtracts the last transaction from the total 
=end
class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount 
    #puts @discount
    @items = []
  end
  
  def total
    @total
    puts "The Current Total is $#{@total}." 
  end

  def add_item(item, price, quantity = 1)
    @sub_total = price * quantity
    @total += @sub_total
    @items << item
    puts "The #{quantity} #{item} costs $#{@sub_total}."
       
  end

  def apply_discount

    if @discount > 0
      @discount_amount = (@total * @discount)/100
      @total -= @discount_amount
      return "With the #{@discount}% discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
     @items
  end   

  def void_last_transaction
    puts "v The Current Total is $#{@total}." 
    puts "v The Subtotal is $#{@sub_total}." 
    new_total = @total - @sub_total
  end

  end #end class

  #Testing

  #cash_register = CashRegister.new
  cash_register_with_discount = CashRegister.new(10)
  cash_register_with_discount.add_item("milk", 5.00, 3)
  cash_register_with_discount.add_item("juice", 3.00, 2)
  cash_register_with_discount.apply_discount
  cash_register_with_discount.total
  cash_register_with_discount.items 
  cash_register_with_discount.void_last_transaction


require "pry"

class CashRegister

    attr_accessor :total, :last_transaction_price
    attr_reader :discount, :items, :prices 

    def initialize(discount=0)
        @total = 0.0
        @discount = discount.to_f
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity=1)
        @last_transaction_price = price * quantity
        @total += (price * quantity)
        if quantity == 1
            @items.append(title)
            @prices.append(price)
        elsif quantity > 1
            quantity.times do
                @items.append(title)
                @prices.append(price) 
            end
        end
    end 

    def apply_discount
        if self.discount == 0.00
            "There is no discount to apply."
        else
            self.total=(@total - (@total * (@discount/100)))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        if @items.length > 0 #realistically, I would want to remove items and prices based off of a @quantity - which i never created
            @items.pop
            self.total = self.total - @last_transaction_price
            @prices.pop
            # binding.pry
        end
    end

end
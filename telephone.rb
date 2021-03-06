require 'csv'

class Symbol
  # extending symbol class 
  # convenience to pass parameters to the map method
  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

class Operator
  attr_accessor :name, :price_list
  
  def initialize(name, price_list)
    @name = name
    @price_list = price_list.sort_by{|key,val| key.length}.to_h
  end

  def rate_for_number(number)
    match_rate = nil
    @price_list.reverse_each do |prefix,rate|
      if number.slice(0,prefix.length) == prefix
        match_rate = rate
        break
      end
    end
    match_rate.nil? ? nil : {self.name => match_rate}
  end
end

class Telephone
  attr_accessor :operators

  def initialize(operators)
    @operators = operators
  end

  def get_smaller_price(number)
    @operators      
      .map(&:rate_for_number.with(number))
      .compact
      .min_by{ |k| k.first[1]}
  end

  def Telephone.from_csv(file_path)
    operators = []
    CSV.foreach(file_path) do |row|
      name = row.delete_at(0)
      price_list = Hash[row.each_slice(2).to_a]
      operators << Operator.new(name,price_list)
    end
    Telephone.new(operators)
  end

end


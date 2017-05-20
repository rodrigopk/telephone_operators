class Symbol
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
    @price_list.each do |prefix,rate|
      match_rate = rate if number.slice(0,prefix.length) == prefix
    end
    match_rate
  end

end

class Telephone

  def initialize(operators)
    @operators = operators
  end

  def get_smaller_price(number)
    @operators.map(&:rate_for_number.with(number)).min
  end

end

op_a = Operator.new("A",{"123" => 0.5, "12345" => 0.11, "1234" => 0.43, "321" => 0.43})
op_b = Operator.new("B",{"12" => 0.6, "1235" => 0.21, "1234" => 0.53})
tel = Telephone.new([op_a,op_b])
number = '123457890020'

puts("#: #{number}")
puts("#OP_A {op_a.name} price list: #{op_a.price_list}")
puts("#OP_B {op_b.name} price list: #{op_b.price_list}")
puts("\n")
puts("A rate: #{op_a.rate_for_number(number)}")
puts("B rate: #{op_b.rate_for_number(number)}")
puts("lowest: #{tel.get_smaller_price(number)}")

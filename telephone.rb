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
    @operators      
      .map(&:rate_for_number.with(number))
      .compact
      .min
  end

end

op_a = Operator.new("A",{
                          "1" =>  0.9, 
                          "268" => 5.1, 
                          "46" => 0.17, 
                          "4620" => 0.0, 
                          "468" => 0.15, 
                          "4631" => 0.15, 
                          "4673" => 0.9, 
                          "46732" => 1.1
                        })

op_b = Operator.new("B",{
                          "1" => 0.92, 
                          "44" => 0.5, 
                          "46" => 0.2,
                          "467" => 1.0,
                          "48" => 1.2
                        })

tel = Telephone.new([op_a,op_b])
# number = '4473212345'

# puts("#: #{number}")
# puts("#OP_A {op_a.name} price list: #{op_a.price_list}")
# puts("#OP_B {op_b.name} price list: #{op_b.price_list}")
# puts("\n")
# puts("A rate: #{op_a.rate_for_number(number)}")
# puts("B rate: #{op_b.rate_for_number(number)}")
# puts("lowest: #{tel.get_smaller_price(number)}")

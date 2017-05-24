require 'csv'
require 'json'

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
    match_rate.nil? ? nil : {self.name => match_rate}
  end

end

class Telephone
  attr_accessor :operators

  def initialize(file_path)
    @operators = []
    from_csv(file_path)
  end

  def get_smaller_price(number)

    @operators      
      .map(&:rate_for_number.with(number))
      .compact
      .min_by{ |k| k.first[1]}
  end

  def from_csv(file_path)
    CSV.foreach(file_path) do |row|
      price_list = {}
      name = row.delete_at(0)
      while (!row.empty?) do
        parsed = JSON.parse(row.delete_at(0))
        price_list.merge!(Hash[parsed.each_slice(2).to_a])
      end
      @operators << Operator.new(name,price_list)
    end
  end

end


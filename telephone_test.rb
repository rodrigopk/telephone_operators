gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'telephone'

class TelephoneTest < Minitest::Test

  def setup
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
  
  @tel = Telephone.new([op_a,op_b])
  end

  def test_find_smallest_rate_from_operators
    number = '1111111111'
    
    assert_equal ({"A" => 0.9}), @tel.get_smaller_price(number)
  end

  def test_use_the_longest_prefix
    number = '4673212345'
    
    assert_equal ({"B" => 1.0}), @tel.get_smaller_price(number)
  end

  def test_find_price_that_doesnt_exists_in_one_list
    number = '4473212345'
    
    assert_equal ({"B" => 0.5}), @tel.get_smaller_price(number)
  end

end
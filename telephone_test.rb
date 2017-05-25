gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'telephone'

class TelephoneTest < Minitest::Test

  def setup
    @tel = Telephone.from_csv('sample_data.csv')
  end

  def test_telephone_should_be_valid
    assert @tel != nil
    assert @tel.operators != nil
  end

  def test_rate_for_number
    op_a = @tel.operators.first
    number = '4673212345'
    assert_equal ({"A" => "1.1"}), op_a.rate_for_number(number)
  end

  def test_find_smallest_rate_from_operators
    number = '1111111111'
    
    assert_equal ({"A" => "0.9"}), @tel.get_smaller_price(number)
  end

  def test_use_the_longest_prefix
    number = '4673212345'
    
    assert_equal ({"B" => "1.0"}), @tel.get_smaller_price(number)
  end

  def test_find_price_when_doesnt_exists_in_one_list
    number = '4473212345'
    
    assert_equal ({"B" => "0.5"}), @tel.get_smaller_price(number)
  end


end
require 'minitest/autorun'

module Luhn
	def self.is_valid?(number)
		ary = number.to_s.split('').map(&:to_i)
		counter = 1
		
		times = (ary.length) / 2
		(1..times.floor).each do |x|
			ary[(ary.length - 1) - counter] = ary[(ary.length - 1) - counter] * 2
			if ary[(ary.length - 1) - counter] >= 10
				ary[(ary.length - 1) - counter] = ary[(ary.length - 1) - counter] - 9
			end
			counter = counter + 2
		end
		sum = 0
		ary.each do |num|
			sum += num
		end
		if sum % 10 == 0
			return true
		else
			return false
		end
	end
end


class TestLuhn < MiniTest::Unit::TestCase

	def test_luhn_valid
		assert Luhn.is_valid?(0)
	end

	def test_luhn_invalid
		assert ! Luhn.is_valid?(4194560385008505)
	end

end


#Luhn.is_valid?(4194560385008504)
#Luhn.is_valid?(4194560385008505)
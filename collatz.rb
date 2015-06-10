def collatz(n, counter = 1)
	while n != 1 do
		if n.even?
			n = n/2
			counter += 1
			return collatz(n, counter)
		else
			n = (3 * n) + 1
			counter += 1
			return collatz(n, counter)
		end
	end
	return counter
end

temp, num = 0, 0
(1..1000000).each do |x|
	temp, num = collatz(x), x if collatz(x) > temp
end
puts temp
puts num


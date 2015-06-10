
def iterative_fib(n)
	ary = [1,1]
	if n == 0 || n == 1 || n == 2
		return 1
	else
		while ary.length <= n
			@new = ary[ary.length-1] + (ary[ary.length - 2])
			ary << @new
		end
	end
	return ary.last
end


def recursive_fib(n)
	if n == 0 || n==1
		return 1
	else
		recursive_fib(n-1) + recursive_fib(n-2)
	end
end


require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end

#@ans = iterative_fib(9)
#@ans = recursive_fib(9)
#puts @ans

# recursive_fib(5) -- recursive_fib(4) + recursive_fib(3)
# recursive_fib(4) = recursive_fib(3) + recursive_fib(2)

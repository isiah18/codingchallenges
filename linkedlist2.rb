class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end

end


class Stack
	attr_reader :data
	
	def initialize
		@data = nil
	end

	def push(element)
		@temp = LinkedListNode.new(element, @data)
		@data = @temp
	end

	def pop
		return @data
		@val = @data.next_node
		@data = @val
	end
end



def print_values(list_node)
  	print "#{list_node.value} --> "
  	if list_node.next_node.nil?
    	print "nil\n"
    	return
  	else
  		print_values(list_node.next_node)
	end
end


def reverse_list(list)
	newstack = Stack.new
	while list
		newstack.push(list.value)
		list = list.next_node
	end
	return newstack.pop
end



def reverse_list2(list, previous=nil)
	if list.next_node.nil?
		list.next_node = previous
		print_values(list)
		return
	else
		@temp = list.next_node
		list.next_node = previous
		reverse_list2(@temp, list)
	end
end


def floydscycle(node, x=node, y=node, counter=1)
	if x.next_node == nil
		return 'Not Loop'
	else
		x = x.next_node
	end
	if counter.even?
		y = y.next_node
	else 
		y = y
	end
	if x == y 
		return 'Infinite'
	else
		counter += 1
		floydscycle(node, x, y, counter)
	end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
#node1.next_node = node3


ans = floydscycle(node3, node3, node3)
puts ans

#reverse_list2(node3)

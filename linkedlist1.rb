
class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end

#	def print_values
#		print "#{self.value} --> "
#		if self.next_node.nil?
#			print "nil\n"
#		else
#			self.next_node.print_values
#		end
#	end
end

#node1 = LinkedListNode.new(37)
#node2 = LinkedListNode.new(99, node1)
#node3 = LinkedListNode.new(12, node2)
#node3.print_values

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


my_stack = Stack.new
node1 = my_stack.push(37)
node2 = my_stack.push(99)
node3 = my_stack.push(12)


print_values(node3)

puts "---------"

revlist = reverse_list(node3)

print_values(revlist)




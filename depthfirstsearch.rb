class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

end

class Queue
	def initialize 
		@queue = []
	end

	def enqueue(item)
		@queue.push(item)
	end

	def dequeue
		@queue.shift
	end
end


def breadth_first(node, trunk, que)
	if trunk.nil?
		return false
	end
	if trunk.payload == node.payload
		return trunk.payload
	elsif
		trunk.children.each do |test|
			if test.payload == node.payload 
				return test.payload
			else
				que.enqueue(test)
			end
		end
		@fir = que.dequeue
		breadth_first(node, @fir, que)
	end
end



def depth_first(node, trunk)
	if trunk.nil?
		return false
	elsif trunk.payload == node.payload
		return trunk
	else
		trunk.children.each do |child|
			return depth_first(node, child)
		end
	end
end


# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, fifth_node])

#check = []
ans=  depth_first(eleventh_node, trunk)
puts ans.payload
#que = Queue.new
#@ans = breadth_first(eleventh_node, trunk, que)




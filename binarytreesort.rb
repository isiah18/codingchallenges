
class BinaryTree
    attr_accessor :payload, :left, :right

    def initialize(payload, left, right)
        @payload = payload
        @left = left
        @right = right
    end

end

def b4sort(array, prevnode=nil)
	@first = array.first
	node = BinaryTree.new(@first, nil, nil)
	if prevnode == nil
		array.shift
		b4sort(array, node)
	end
	if node.payload < prevnode.payload
		if prevnode.left == nil 
			prevnode.left = node
			array.shift
			b4sort(array, prevnode)
		else
			b4sort(array, prevnode.left)
		end
	elsif node.payload > prevnode.payload
		if prevnode.right == nil
			prevnode.right = node
			array.shift
			b4sort(array,prevnode)
		else
			b4sort(array, prevnode.right)
		end
	end	
end


=begin
def bsort(array, trunk)
	@first = array.first
	node = BinaryTree.new(@first, nil, nil)
	if node.payload < trunk.payload
		if trunk.left == nil
			trunk.left = node
			array.shift
		else 
			bsort(array, trunk.left)
	elsif x > trunk.payload
		trunk.right = x
	end
end
=end

ary = [7,4,9,1,6,14,10]
b4sort(ary)

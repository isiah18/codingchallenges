class Image
	attr_accessor :ary
	def initialize(ary)
		@ary = ary			
	end
	
	def output_image
		self.ary.each do |x|
			x.each do |cell|
				print cell
			end
			puts " "
		end
	end
end


#image = Image.new([
#	[0,0,0,0],
#	[0,1,0,0],
#	[0,0,0,1],
#	[0,0,0,0]
#	])


#image.output_image
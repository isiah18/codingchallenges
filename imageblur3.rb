
require_relative 'imageblur1.rb'

class Image3 < Image

	#attr_accessor :ary
	#def initialize(ary)
	#	@ary = ary			
	#end
	
	#def output_image
	#	self.ary.each do |x|
	#		x.each do |cell|
	#			print cell
	#		end
	#		puts " "
	#	end
	#end

	def blur(n)
		pxls = []
		self.ary.each_index do |i|
			subary = self.ary[i]
			subary.each_index do |cell|
				if subary[cell] == 1 
					pxls.push([i,cell])
				end
			end			
		end
		
		pxls.each do |pair|
			row = pair.first
			col = pair.last
			colary = self.ary[row]

			#if row == -1 || row == self.ary.length-1 || col == -1 || col == colary.length-1

				if row == 0 && col == 0
					n.times do 
						if row == self.ary.length-1 
							self.ary[row][col+1] =1
							break
						else
							self.ary[row][col+1] = 1
							self.ary[row+1][col] = 1
							row = row + 1
						end
					end
					row = pair.first
					n.times do
						if col == colary.length-1
							self.ary[row+1][col] = 1
							break
						else
							self.ary[row][col+1] = 1
							self.ary[row+1][col] = 1
							col +=1
						end
					end
				elsif row == 0 && col == colary.length-1
					n.times do
						if row == self.ary.length-1 
							self.ary[row][col-1] = 1
							break
						else
							self.ary[row][col-1] = 1
							self.ary[row+1][col] = 1
							row = row+1
						end
					end
					row = pair.first
					n.times do 
						if col == -1
							break
						else
							self.ary[row][col-1] = 1
							self.ary[row+1][col] = 1
							col = col-1
						end
					end
				elsif row == 0 && col != 0 && col != colary.length-1
					self.ary[row][col-1] = 1
					self.ary[row][col+1] = 1
					self.ary[row+1][col] = 1
				elsif col == 0 && row != 0 && row != self.ary.length-1
					self.ary[row][col+1] = 1
					self.ary[row+1][col] = 1
					self.ary[row-1][col] = 1
				elsif row == self.ary.length-1 && col == 0 
					self.ary[row][col+1] = 1
					self.ary[row-1][col] = 1
				elsif row == self.ary.length-1 && col == colary.length-1
					self.ary[row][col-1] = 1
					self.ary[row-1][col] = 1
				elsif row == self.ary.length-1 && col != 0 and col != colary.length-1
					self.ary[row][col-1] = 1
					self.ary[row][col+1] = 1
					self.ary[row-1][col] = 1
				elsif col == colary.length-1 && row != 0 && row != self.ary.length-1
					self.ary[row][col-1] = 1
					self.ary[row+1][col] = 1
					self.ary[row-1][col] = 1
				else
					self.ary[row][col+1] = 1
					self.ary[row][col-1] = 1
					self.ary[row+1][col] = 1
					self.ary[row-1][col] = 1
				end
				
		end
		self.output_image
	end
end

image = Image3.new([
	[0,0,0,1],
	[0,0,0,0],
	[0,0,0,0],
	[0,0,0,0]
	])

image.blur(4)

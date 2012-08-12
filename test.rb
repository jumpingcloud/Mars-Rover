class Rover

	puts "It works"

end

class Nasa

	@rover_id = 0
	
	def deploy_rovers
		@rover_id += 1
		@rover#{@rover_id} = Rover.new
	puts @rover_id
	end
end

mission1 = Nasa.new
mission1.deploy_rovers

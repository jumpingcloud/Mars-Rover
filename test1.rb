class Rover

	puts "It works"

end

class Nasa

	@rover_id = 0
	
	def deploy_rovers
		puts "here is the deploy method"
#<Hanmac> "@rovers ||= []" and next line: "@rovers << Rover.new" with this you dont need any @rover_id

	@rovers ||= []
	#@rovers << Rover.new
	end
end

mission1 = Nasa.new
mission1.deploy_rovers

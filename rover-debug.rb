class Rover
#  a rover will be created with a position and a heading!
attr_accessor :x, :y, :heading

# => in the pass in attributes
#  instance variables 
# @heading
# @position  = "#{@x} #{@y}"
# Getter and setter for position
	def initialize
		puts "I got Initialized!!"
		# puts "holy omg nasa changed my heading to #{@heading}"
	end

	def move_forward
		#  Maybe I should use case here instead.

		if @heading == "N"
			@y += 1
		elsif @heading == "S"
			@y -= 1
		elsif @heading == "E"
			@x += 1
		else @heading == "W"
			@x -= 1
		end
	end

	def turn_left
		# this will change heading
		if @heading == "N"
			@heading = "W"
		elsif @heading == "W"
			@heading = "S"
		elsif @heading == "S"
			@heading = "E"
		elsif @heading == "E"
			@heading = "N"
		else
			puts 'Something is wrong with the Heading'
		end

	end

	def turn_right
		# this will change heading
		if @heading == "N"
			@heading = "E"
		elsif @heading == "E"
			@heading = "S"
		elsif @heading == "S"
			@heading = "W"
		elsif @heading == "W"
			@heading = "N"
		else
			puts 'Something is wrong with the Heading'
		end
	end

	def report_position
		puts "#{@x} #{@y} #{@heading}"
	end

	def test
		puts "holy omg nasa changed my x to #{@x}"
		puts "holy omg nasa changed my y to #{@y}"
		puts "holy omg nasa changed my heading to #{@heading}"
	end

end



class Nasa
	def initialize
		@rovers = []
		@transmission = []
		@rover_id = 0
		@coordary = 0
		@commands = 1
	end

	def send_transmission
		file = File.open('transmission.txt', 'r') do |file|
			while line = file.gets
				@transmission << line.chomp
			end
		end
	end

	def find_plateau
		@plateau = @transmission[0]
	end

	def deploy_rovers
		@rover_orders = @transmission
		@rover_orders.shift
		@number_of_rovers = @rover_orders.length / 2
		puts "you have #{@number_of_rovers} rovers"
		
		@number_of_rovers.times do
			@rovers << Rover.new
			puts @rovers[@rover_id]
			puts "this is your first coords #{@rover_orders[@coordary]}"
			@coordinates = @rover_orders[@coordary].split
			@coordary += 2
			puts @coordinates
			@rovers[@rover_id].x = @coordinates[0].to_i
			@rovers[@rover_id].y = @coordinates[1].to_i
			@rovers[@rover_id].heading = @coordinates[2]
			@rovers[@rover_id].test
			puts "this is rover id #{@rover_id}"
			@rover_id += 1
			puts "this is rover id plus one #{@rover_id}"
		end
	end

	def control_rover
		@rover_id = 0
		@number_of_rovers.times do
			@rover_orders[@commands].each_char do |i|
				puts i
				@rovers[@rover_id].test
  				if i == "M"
  					@rovers[@rover_id].move_forward
  				elsif i == "L"
  					@rovers[@rover_id].turn_left
  				elsif i == "R"
  					@rovers[@rover_id].turn_right
  				else
  					puts 'Command not yet implemented'
  				end
  			end 
  			@rover_id += 1
  			@commands += 2
		end

	end
	
	def report_position
		@rover_id = 0
		@number_of_rovers.times do
			@rovers[@rover_id].report_position
			@rover_id += 1
		end
	end

	# def debug
	# 	# @number_of_rovers = @transmission.shift
	# 	# @coordinates = @transmission[1]
	# 	# @rover_orders = @transmission[2]

	# 	# puts @transmission
	# 	# puts @plateau
	# 	# puts @number_of_rovers
	# 	# puts @rover_id
	# 	# puts 'these are the rover orders'
	# 	# puts @rover_orders
	# 	# puts 'wtf'
	# 	# puts @transmission[1]
		
	# 	# this needs to be done within a method of its own I'm thinking
	# 	# and within the method make changes to the rovers position
	# 	# based on what orders come in.
	# 	@rover_orders.each_char do |i|
 #  			puts i 
	# 		end 
	# 	#puts length.class
	# end
end

mission1 = Nasa.new
mission1.send_transmission
mission1.find_plateau
mission1.deploy_rovers
mission1.control_rover
mission1.report_position

# mission1.debug









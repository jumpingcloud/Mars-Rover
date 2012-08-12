class Rover
#  a rover will be created with a position and a heading!
	attr_accessor :x, :y, :heading

	def move_forward
		#  changes x and y

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
		
		@number_of_rovers.times do
			@rovers << Rover.new
			@coordinates = @rover_orders[@coordary].split
			@coordary += 2
			@rovers[@rover_id].x = @coordinates[0].to_i
			@rovers[@rover_id].y = @coordinates[1].to_i
			@rovers[@rover_id].heading = @coordinates[2]
			@rover_id += 1
		end
	end

	def control_rover
		@rover_id = 0
		@number_of_rovers.times do
			@rover_orders[@commands].each_char do |i|
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

	
end

mission1 = Nasa.new
mission1.send_transmission
mission1.find_plateau
mission1.deploy_rovers
mission1.control_rover
mission1.report_position

# mission1.debug









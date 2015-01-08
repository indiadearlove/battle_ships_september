class Ship
	attr_reader :size
	attr_accessor :hits

	def initialize(size)
		@size, @hits = size, 0
	end

	def hit!
		self.hits += 1
		true
	end

	def sunk?
		hits == size
	end

	def floating?
		!sunk?
	end

	def self.aircraft_carrier
		new 4 #Made all sizes 1 less so that it comes out with actual value
	end

	def self.battleship
		new 3
	end

	def self.destroyer
		new 2
	end

	def self.submarine
		new 2
	end

	def self.patrol_boat
		new 1 #changed this from 5
	end

end
#  console version of mastermind game
# for more information check the wikipedia
class String
	def black;       "\e[40m#{self}\e[0m" end
	def red;         "\e[41m#{self}\e[0m" end
	def green;       "\e[42m#{self}\e[0m" end
	def brown;       "\e[43m#{self}\e[0m" end
	def blue;        "\e[44m#{self}\e[0m" end
	def magenta;     "\e[45m#{self}\e[0m" end
	def cyan;        "\e[46m#{self}\e[0m" end
	def gray;        "\e[47m#{self}\e[0m" end
end
module Colors
  
	
	@@color_palette = {
		1 =>'black', 
		2 => 'red', 
		3 => 'green', 
		4 => 'brown', 
		5 => 'blue', 
		6 => 'magenta', 
		7 => 'cyan', 
		8 => 'gray'
	}
end

class Maker

	def choose
		ask_for_num

	  case @num
		when 1
			black
		when 2
			red
		when 3
			green
		when 4
			brown
		when 5
			blue
		when 6
			magenta
		when 7
			cyan
		when 8
			gray
		end
	end

end

class HumanBreaker
	include Colors
	def initialize(name)
		@name = name
	end

	def ask_for_num
		puts 'Please enter 4 numbers'
		@num = gets.chomp.to_i
		ask_for_num if @num.to_s.length < 4 || @num.to_s.length > 4
	end

	def choose
		ask_for_num
		@num.to_s.split("").each do |n|
			color = @@color_palette[n.to_i]
			case color
			when 'black'
				print n.black
			when 'red'
				print n.red
			when 'green'
				print n.green
			when 'brown'
				print n.brown
			when 'blue'
				print n.blue
			when 'magenta'
				print n.magenta
			when 'cyan'
				print n.cyan
			when 'gray'
				print n.gray
			end
		end
	end
end

jack = HumanBreaker.new('jack')
jack.choose
puts " "
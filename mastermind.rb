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
		'1' =>'black', 
		'2' => 'red', 
		'3' => 'green', 
		'4' => 'brown', 
		'5' => 'blue', 
		'6' => 'magenta', 
		'7' => 'cyan', 
		'8' => 'gray'
	}
end

class Maker
	include Colors
	
	@@chosen_colors      # bu sonra yoxlama ucun lazim olasan
	@@random_colors = []
	def random_color_chose
		while random_colors.length < 4
			random_color = rand(1..6)
			random_colors.push(random_color) unless random_colors.include?(random_color)
		end
	end

	def self.ask_for_num
		puts 'Please enter 4 numbers from 1 to 6 inclusive.'
		@@num = gets.chomp.to_i
		ask_for_num if @num.to_s.length < 4 || @num.to_s.length > 4
	end
	
	# def self.make
	# 	@@random_colors.each do |color|
	# 		case color
	# 		when 1
	# 			@@chosen_colors.push(@@color_palette[1])
	# 			black
	# 		when 2
	# 			@@chosen_colors.push(@@color_palette[2])
	# 			red
	# 		when 3
	# 			@@chosen_colors.push(@@color_palette[3])
	# 			green
	# 		when 4
	# 			@@chosen_colors.push(@@color_palette[4])
	# 			brown
	# 		when 5
	# 			@@chosen_colors.push(@@color_palette[5])
	# 			blue
	# 		when 6
	# 			@@chosen_colors.push(@@color_palette[6])
	# 			magenta
	# 		when 7
	# 			@@chosen_colors.push(@@color_palette[7])
	# 			cyan
	# 		when 8
	# 			@@chosen_colors.push(@@color_palette[8])
	# 			gray
	# 		end
	# 	end
	# end
end

class CompMaker < Maker
	include Colors
end



class HumanBreaker < Maker
	include Colors
	@@find_attempts = []
	def initialize(name)
		@name = name
	end

	def ask_for_num
		puts 'Please enter 4 numbers from 1 to 6 inclusive.'
		@num = gets.chomp.to_i
		ask_for_num if @num.to_s.length < 4 || @num.to_s.length > 4
	end

	def choose
		ask_for_num
		@num.to_s.split("").each do |n|
			color = @@color_palette[n]
			case color
			when 'black'
				@@find_attempts.push(color)
				print n.black
			when 'red'
				@@find_attempts.push(color)
				print n.red
			when 'green'
				@@find_attempts.push(color)
				print n.green
			when 'brown'
				@@find_attempts.push(color)
				print n.brown
			when 'blue'
				@@find_attempts.push(color)
				print n.blue
			when 'magenta'
				@@find_attempts.push(color)
				print n.magenta
			when 'cyan'
				@@find_attempts.push(color)
				print n.cyan
			when 'gray'
				@@find_attempts.push(color)
				print n.gray
			end
		end
	end
end

jack = HumanBreaker.new('jack')
jack.choose
puts " "
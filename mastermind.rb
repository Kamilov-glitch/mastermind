require 'pry'

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
	@@num = 0
	@@chosen_colors = []      # bu sonra yoxlama ucun lazim olasan
	@@random_colors = []
	def self.random_color_chose
		while @@random_colors.length < 4
			random_color = rand(1..6).to_s
			@@random_colors.push(random_color) unless @@random_colors.include?(random_color)
		end
	end

	def self.ask_for_num
		puts 'Please enter 4 numbers from 1 to 6 inclusive.'
		@@num = gets.chomp
		ask_for_num if @@num.length < 4 || @@num.to_s.length > 4
		@@chosen_colors = @@num.split("")
	end

	def self.random_color_getter
		@@random_colors
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

class CompBreaker < Maker
	include Colors
	@@random_comp_attempts = []

	def self.random_comp_color_chose
		random_color = rand(1..6).to_s * (4 - @@random_comp_attempts.length)
		unless @@random_comp_attempts.include?(random_color)
			@@random_comp_attempts += random_color.split("")
		else
			self.random_comp_color_chose
		end 
	end
	@@x = 0
	@@temporary_holder = []
	def self.check
		p @@random_comp_attempts
    # binding.pry
		if @@random_comp_attempts == @@chosen_colors
			"Computer wins!"
		else
      if @@chosen_colors.include?(@@random_comp_attempts[@@x])
        @@chosen_colors.select{|num| num == @@random_comp_attempts[@@x]}.length.times do
          @@temporary_holder.push(@@random_comp_attempts[@@x])
					@@x += 1
        end
      end
			@@random_comp_attempts = @@temporary_holder
      if @@random_comp_attempts.length < 4
        self.random_comp_color_chose
        self.check 
      else
        @@random_comp_attempts.shuffle!
        self.check
      end
    end
    # true
  end
end



class HumanBreaker < Maker
	include Colors
	@@num = 0
	@@find_attempts = []

	def initialize(name)
		@name = name
	end

	def self.ask_for_num
		puts 'Please enter 4 numbers from 1 to 6 inclusive.'
		@@num = gets.chomp
		if (@@num.to_s.length < 4 || @@num.to_s.length > 4)
			ask_for_num
		end
		@@find_attempts = @@num.to_s.split("")
	end

	def self.choose
		self.ask_for_num
		@@find_attempts.each do |n|
			case n
			when '1'
				print n.black
			when '2'
				print n.red
			when '3'
				print n.green
			when '4'
				print n.brown
			when '5'
				print n.blue
			when '6'
				print n.magenta
			when '7'
				print n.cyan
			when '8'
				print n.gray
			end
		end
	end

	def self.find_attempts_getter
		@@find_attempts
	end

	def self.check
		if @@find_attempts == @@random_colors
			"You Win!"
		else
			@@find_attempts.each_with_index do |n, indx|
				if @@random_colors.include?(n) && @@random_colors[indx] == n
					print '◯'.green
				elsif @@random_colors.include?(n)
					print '◯'.black
				end
			end
			puts " "
			"Try Again"
		end
	end
			
	
end
# 12.times do 
# 	Maker.random_color_chose
# 	# p Maker.random_color_getter
# 	HumanBreaker.choose
# 	puts " "
# 	# p HumanBreaker.find_attempts_getter
# 	p HumanBreaker.check
# end

Maker.ask_for_num
CompBreaker.random_comp_color_chose
p CompBreaker.check

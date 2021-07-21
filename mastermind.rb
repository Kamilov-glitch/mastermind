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
	def ozblack;     "\e[30m#{self}\e[0m" end
	def ozred;       "\e[31m#{self}\e[0m" end
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

	@@hash_to_store_loop = {
		'1' => 0,
		'2' => 0,
		'3' => 0,
		'4' => 0,
		'5' => 0,
		'6' => 0
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
			@@random_colors.push(random_color)
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
	
	def self.print_color(arr)
		arr.each do |n|
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
		puts " "
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

	@@for_test_counter = 0
	@@random_comp_attempts = []
	@@colors_that_have_been_checked = []
	def self.random_comp_color_chose
		random_color = (rand(1..6).to_s * (4 - @@random_comp_attempts.length)).split("")
		unless @@random_comp_attempts.include?(random_color[0]) || @@colors_that_have_been_checked.include?(random_color[0])
			@@random_comp_attempts += random_color
			@@colors_that_have_been_checked += random_color
			@@for_test_counter += 1 
		else
			self.random_comp_color_chose
		end
		# @@colors_that_have_been_checked += random_color 
	end

	def self.equality
		@@random_comp_attempts == @@chosen_colors
	end

	@@x = 0
	@@temporary_holder = []
	def self.check
		self.print_color(@@random_comp_attempts)
		p @@random_comp_attempts
		p @@for_test_counter
    # binding.pry
		if self.equality
			@@random_comp_attempts = []
			@@temporary_holder = []
			@@for_test_counter = 0
			@@colors_that_have_been_checked = []
			@@x = 0
			"Computer wins!"
		else
      if @@chosen_colors.include?(@@random_comp_attempts[@@x])
        @@temporary_holder += @@chosen_colors.select{|num| num == @@random_comp_attempts[@@x]}   #.count() - la evez et bunu
        # @@temporary_holder.push(@@random_comp_attempts[@@x])
		@@x += @@chosen_colors.select{|num| num == @@random_comp_attempts[@@x]}.length
      end
			@@random_comp_attempts = @@temporary_holder
      if @@random_comp_attempts.length < 4
        self.random_comp_color_chose
        self.check 
      else
        for x in 0..3
					for y in x + 1..3
						if (@@random_comp_attempts[x] != @@chosen_colors[x] && @@random_comp_attempts[y] != @@chosen_colors[y]) && x != 3
							@@random_comp_attempts[x], @@random_comp_attempts[y] =  @@random_comp_attempts[y], @@random_comp_attempts[x]
							break if equality
						elsif x == 3 && @@random_comp_attempts[x] != @@chosen_colors[x] && @@random_comp_attempts[0] != @@chosen_colors[0]
							@@random_comp_attempts[x], @@random_comp_attempts[0] =  @@random_comp_attempts[0], @@random_comp_attempts[x]
							break if self.equality == true
						end
					end
				end
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
		@@qurbanliq_quzu = @@num.to_s.split("")
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

	def self.random_colors_getter
		@@random_colors
	end

	def self.find_attempts_getter
		@@find_attempts
	end

	def self.check
		if @@find_attempts == @@random_colors
			@@random_colors = []
			"You Win!"
		else
			
			# @@num_var = 0
			@@find_attempts.each_with_index do |n, indx|
				if @@random_colors.include?(n) && @@random_colors[indx] == n
					print '◯'.ozred
					@@hash_to_store_loop[n] += 1
					@@qurbanliq_quzu.delete_at(indx)
					# @@num_var += 1
				end
			end
			
			@@qurbanliq_quzu.each_with_index do |n ,indx|
				# p @@hash_to_store_loop[n]
				if @@random_colors.include?(n) && @@hash_to_store_loop[n] < @@random_colors.count(n)
					print '◯'.ozblack
					@@hash_to_store_loop[n] += 1
				end
			end
			@@hash_to_store_loop.each {|k, v| @@hash_to_store_loop[k] = 0}
			puts " "
			"Try Again"
		end
	end
			
	
end

def question_to_user
	puts "Would you like to play again? Enter 'y' for yes or 'n' for no:"
	an_answer = gets.chomp.downcase
	if an_answer == 'y'
		game
	elsif an_answer == 'n'
		puts "Maybe another time. Bye!"
	else
		puts "Please enter either 'y' or 'n'."
		question_to_user
	end
end

def game
	puts "Press and enter 'm' for Maker and 'b' for Breaker:"
	user_choice = gets.chomp.downcase
	if user_choice == 'b'
		turn = 1
		while turn <= 12 do
			puts "#Turn #{turn}" 
			Maker.random_color_chose
			# p Maker.random_color_getter
			HumanBreaker.choose
			puts " "
			# p HumanBreaker.find_attempts_getter
			# p HumanBreaker.check
			turn += 1
			if HumanBreaker.check == "You Win!"
				break
			elsif turn == 12
				puts 'Well, your twelve tries are over, sadly...'
				break
			end
		end
		 
	elsif user_choice == 'm'
		Maker.ask_for_num
		CompBreaker.random_comp_color_chose
		p CompBreaker.check
	else
		puts "Please stop being stupid and enter either 'm' or 'b' for gods sake!"
		game
	end

	question_to_user

end

puts "Okay, the rules of the game are simple, but I ain't gonna explain them."
puts "Just google it and you'll find the information necessary."
puts "Anyways, in my version of the game you can choose to be breaker of maker."
puts "If you choose to be a breaker then you'll have to guess the randomly generated code by the computer."
puts "You'll have 12 rounds and each round you'll be given hints such as #{'◯'.red} or #{'◯'.black}."
puts "Red one means one of your guesses is included in code and is in correct position, black one means it is in code,"
puts "But not in correct position."
puts "Oh yes, the colors being used are:"
puts "#{'1'.black}#{'2'.red}#{'3'.green}#{'4'.brown}#{'5'.blue}#{'6'.magenta}"
puts "You'll figure out the rest just start playin already!!"
puts "Would you like to play as a Maker or Breaker?"
game


# variable-lari sifirlamiq lazimdir, its almost done otherwise
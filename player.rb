class Player
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

class Guesser < Player
	def Guess
		#enter letter to be checked
	end
end

class Hanger < Player
	def SetWord
		puts "#{@name}, enter word to be guessed (between 5 and 12 characters):"
		word_to_be_guessed = gets.chomp
		word_to_be_guessed.capitalize!
		word_array = word_to_be_guessed.split("")
		word_array
	end
end
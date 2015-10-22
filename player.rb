class Player
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

class Guesser < Player
	def Guess
		puts "Enter letter to be checked: "
		letter = gets.chomp
		letter.upcase!
		letter
	end
end

class Hanger < Player
	def SetWord
		puts "#{@name}, enter word to be guessed (between 5 and 12 characters):"
		word_to_be_guessed = gets.chomp
		word_to_be_guessed.upcase!
		word_array = word_to_be_guessed.split("")
		word_array
	end
end

class Computer < Player
	def initialize (name,file)
		@name = name
		filestring = IO.read(file)
		@dictionary = filestring.split("\r\n")
	end

	def SetWord 
		index = rand((@dictionary.size)-1)
		word_to_be_guessed=@dictionary[index]
		word_to_be_guessed.upcase!
		word_array = word_to_be_guessed.split("")
		word_array
	end

end
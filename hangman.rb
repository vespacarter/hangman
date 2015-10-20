class Game
	def initialize
		@attempts_left = 6
		@guessing_word = []
		@showing_word = []
	end

	def StartGame
		puts "Time to play Hangman!\n=====================\n\nEnter Guesser name:"
		guesser_name = gets.chomp
		@guesser_player = Guesser.new(guesser_name)
		puts "Enter Hanger name:"
		hanger_name = gets.chomp
		@hanger_player = Hanger.new(hanger_name)
	end

	def EnterLetter
		#ask for new letter
	end

	def CheckLetter
		#check if entered letter is on word to be guessed
	end

	def AttemptsLeft
		#calculate attempts left
	end

	def GameOver
		#end game, show winner
	end

	def EnterWordToBeGuessed
		@guessing_word = @hanger_player.SetWord
		SetWordToGuess
	end

	def SetWordToGuess
		@guessing_word.each do |letter|
			@showing_word.push("_")
		end
	end

end

require_relative "player.rb"

mygame = Game.new
mygame.StartGame
mygame.EnterWordToBeGuessed
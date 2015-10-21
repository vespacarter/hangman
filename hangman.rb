class Game
	attr_reader :attempts_left
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

	def Solve
		puts "Enter solution:"
		solution = gets.chomp
		solution.upcase!
		CheckWinner(solution)
	end

	def ShowBoard
		puts "***#{@guesser_player.name} trying to guess #{@hanger_player.name}'s word ***"
		puts "Attempts left: #{@attempts_left}"
		@showing_word.each do |letter|
			print "#{letter} "
		end
		print "\n"
	end

	def CheckLetter(letter)
		puts letter
		found = false
		@guessing_word.each_with_index do |word, index|
			if word == letter
				@showing_word[index] = letter
				found = true
			end
		end
		if !found 
			AttemptsLeft()
		else
			CheckWinner()
		end
	end

	def CheckWinner (answer = ".")
		if answer == "." && @guessing_word.join == @showing_word.join
				GameOver(@guesser_player)
		elsif answer == @guessing_word.join
				GameOver(@guesser_player)
		else
				puts "Wrong answer #{@guesser_player.name}! Keep trying!"
		end
	end

	def AttemptsLeft
		@attempts_left -= 1
		GameOver(@hanger_player) if @attempts_left == 0
	end

	def GameOver(winner)
		@attempts_left = 0
		puts "#{winner.name} WINS!"
		puts "#{@guessing_word.join} was the answer!"
	end

	def EnterWordToBeGuessed
		@guessing_word = @hanger_player.SetWord
		SetWordToGuess()
	end

	def SetWordToGuess
		@guessing_word.each do |letter|
			@showing_word.push("_")
		end
	end

	def WhatToDo()
		puts "\e[H\e[2J" #clears screen
		ShowBoard()
		puts "So #{@guesser_player.name}, what you wanna do?\n 1.- Enter a letter \n 2.- Solve word"
		option = gets.chomp
		if option == "1" 
			CheckLetter(@guesser_player.Guess)
		elsif option == "2"
			Solve()
		end
			
	end

end

require_relative "player.rb"

mygame = Game.new
mygame.StartGame
mygame.EnterWordToBeGuessed
while mygame.attempts_left != 0 
	mygame.WhatToDo
end
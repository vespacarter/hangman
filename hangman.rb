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

	def Solve

	end

	def ShowBoard
		puts "***#{@guesser_player.name} trying to guess #{@hanger_player.name}'s word ***"
		puts "Attempts left: #{@attempts_left}"
		@showing_word.each do |letter|
			print "#{letter} "
		end
		print "\n"
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
		SetWordToGuess()
	end

	def SetWordToGuess
		@guessing_word.each do |letter|
			@showing_word.push("_")
		end
	end

	def WhatToDo()
		puts "So #{@guesser_player.name}, what you wanna do?\n 1.- Enter a letter \n 2.- Solve word"
		option = gets.chomp
		if option == 1 
			CheckLetter(@guesser_player.Guess)
		elsif option == 2
			Solve()
		end
			
	end


end

require_relative "player.rb"

mygame = Game.new
mygame.StartGame
mygame.EnterWordToBeGuessed
mygame.ShowBoard
class Game
	def initialize(guesser_player,hanger_player)
		@guesser_player = guesser_player
		@hanger_player = hanger_player
		@attempts_left = 6
		@guessing_word = []
		@showing_word = []
	end

	def StartGame
	#ask for players, ask for word to be guessed
	end

	def EnterLetter
	#ask for new letter
	end

	def CheckLetter
	#check if entered letter is on word to be guessed
	end

	 
end

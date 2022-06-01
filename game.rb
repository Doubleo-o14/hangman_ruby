class Hangman
    def initialize 
        @letters = ('a'..'z').to_a
        @word = words.sample
    end

    def words
        [
            ["football", "most loved sport in europe"],
            ["jogging", "not walking around"],
            ["singing", "a form ofspeaking"],
            ["education", "learning to improve your skill"],
    
        ]
    end

    def begin
        puts "Your word has #{@word.first.length} letters"
        puts "Lets get the game started. your clue is it #{@word.last}"
        puts "enter a letter"
        guess = gets.chomp

        puts "You guessed #{guess}"
    end

    game = Hangman.new
    game.begin

end


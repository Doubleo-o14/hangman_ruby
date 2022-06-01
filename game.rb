class Hangman
    def initialize 
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
    end

    def words
        [
            ["football", "most loved sport in europe"],
            ["jogging", "not walking around"],
            ["singing", "a form ofspeaking"],
            ["education", "learning to improve your skill"],
    
        ]
    end

    def tease
        word_tease = ""

        @word.first.length.times do
            word_tease += "_ "
        end
        puts word_tease
    end

    def make_guess
        if @lives > 0
            puts "enter a letter"
            guess = gets.chomp

            right_choice = @word.first.include? guess
            if right_choice
                puts "You picked correct!"
            else
                @lives -= 1
                puts "Your wrong try again, you have #{@lives} tries left."
                make_guess
            end
        else
            puts "Sorry you failed to save yourself.Game over."
        end
     end

    def begin
        puts "Your word has #{@word.first.length} letters"
        tease
        puts "Lets get the game started. your clue is it #{@word.last}"
        make_guess
    end

    game = Hangman.new
    game.begin

end


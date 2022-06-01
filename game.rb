class Hangman
    def initialize 
        @word = words.sample
        @lives = 7
        @word_tease = ""

        @word.first.length.times do
            @word_tease += "_ "
        end
    end

    def words
        [
            ["football", "most loved sport in europe"],
            ["jogging", "not walking around"],
            ["singing", "a form ofspeaking"],
            ["education", "learning to improve your skill"],
    
        ]
    end

    def tease last_guess = nil
        update_tease(last_guess) unless last_guess.nil?
        puts @word_tease
    end

    def update_tease last_guess
        new_tease =@word_tease.split

        new_tease.each_with_index do |letter, index|
            #replace blank values with lettters user has guessed
            if letter == '_' && @word.first[index] == last_guess
                new_tease[index] = last_guess
            end
        end
        @word_tease = new_tease.join(' ')

    end

    def make_guess
        if @lives > 0
            puts "enter a letter"
            guess = gets.chomp

            right_choice = @word.first.include? guess
            if guess == "exit"
                puts "Thanks for playing!"
            elsif right_choice
                puts "You picked correct!"

                tease guess
                if @word.first == @word_tease.split.join
                    puts "Congrats! you saved yourself and won this round."
                else
                    make_guess
                end
        
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
        puts "To exit the game just type the word exit"
        puts "Your word has #{@word.first.length} letters"
        tease
        puts "Lets get the game started. your clue is it #{@word.last}"
        make_guess
    end

    game = Hangman.new
    game.begin

end


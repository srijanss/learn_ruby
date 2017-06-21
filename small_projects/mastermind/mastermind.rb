require './usefulfeedback'

class MasterMind
    include UsefulFeedback
    attr_accessor :player, :chances, :secret_code

    def initialize(player)
        @player = player
        @chances = 0
        @secret = SecretCode.new
        @player_guesses = {}
        puts @secret.code.inspect
    end

    def guess_the_code(code)
        @player_guesses[@chances + 1] = code
        code = @secret.format_code(code)
        give_feedback(code)
    end

    def give_feedback(code)
        if @chances >= 12
            puts "#{@player.capitalize!}, You have no chances remaining, GAME OVER!!"
            return true
        elsif !@secret.match_code(code)
            @chances += 1
            puts "You have #{(12 - @chances).to_s} chances remaining"
            return false
        else
            puts "#{@player.capitalize!}, You guessed it right!!"
            return true
        end
    end
end

Player = Struct.new(:name)

class SecretCode
    include UsefulFeedback
    attr_accessor :code

    def initialize
        @code = []
        1.upto(4) { @code << COLORS.sample.downcase }
    end
    
    def format_code(code)
        code.map! { |item| item.downcase.strip}
    end

    def match_code(code)
        if @code.eql?(code)
            return true
        else
            code.each do |item|
                if !@code.include? item
                    puts "Position #{@code[code.index(item)]} : " + feedback(-1)
                elsif @code.include? item and @code[code.index(item)] != item
                    puts "Position #{@code[code.index(item)]} : " + feedback(1)
                else
                    puts "Position #{@code[code.index(item)]} : " + feedback(0)
                end
            end
            return false
        end
    end
end

puts "Enter your name"
player = gets.chomp
mm = MasterMind.new(player)
puts "Enter your guess : Example: Green, Yellow, Blue, Black"

while true
    guess = gets.chomp.split(",")
    break if mm.guess_the_code(guess)
end

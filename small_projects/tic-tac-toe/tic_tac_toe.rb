# TicTacToe class holds the main concept of the game
class TicTacToe
    attr_accessor :player1, :player2, :block

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @block = {}
        initialize_grid
    end

    private
    def initialize_grid
        1.upto(9) { |index|  add_block(index) }
        show_grid
    end

    def add_block(id)
        @block[id] = Block.new(id)
    end

    def show_grid
        @block.each do |id, b| 
            if id%3 != 0 
                print b.value.to_s + "\t"
            else
                puts b.value.to_s
                puts ""
            end
        end
    end

    def block_values_are_number
        is_number = false
        @block.each do |id, b| 
            if b.value.is_a? Integer
                is_number = true
            else
                is_number = false
            end
        end
        is_number
    end
    
    def block_value_equal(x, y, z)
        if @block[x].value == @block[y].value and @block[y].value == @block[z].value
            values_equal = true
        else
            values_equal = false
        end
        values_equal
    end

    def check_blocks
        winner_choice = ""
        if block_value_equal(1,2,3)
            winner_choice = @block[1].value
        elsif block_value_equal(4,5,6)
            winner_choice = @block[4].value
        elsif block_value_equal(7,8,9)
            winner_choice = @block[7].value
        elsif block_value_equal(1,4,7)
            winner_choice = @block[1].value
        elsif block_value_equal(2,5,8)
            winner_choice = @block[2].value
        elsif block_value_equal(3,6,9)
            winner_choice = @block[3].value
        elsif block_value_equal(1,5,9)
            winner_choice = @block[1].value
        elsif block_value_equal(7,5,3)
            winner_choice = @block[7].value
        elsif !block_values_are_number
            winner_choice = "D"
        end
        winner_choice
    end

    def show_result
        result = check_blocks
        if result == "D"
            result = "GAME DRAW"
        elsif result == player1.item
            result = "Player 1 Wins!!"
        elsif result == player2.item
            result = "Player 2 Wins!!"
        else
            result = "CONTINUE"
        end
        result
    end
    
    public
    def update_grid(player, player_number)
        puts "Player #{player_number} choose the number where you want to put your item"
        choice = gets.chomp
        if choice != "exit"
            @block[choice.to_i].value = player.item
            show_grid
            puts show_result
            choice = "exit" if show_result != "CONTINUE"
        end
        choice
    end
end

# Create players with name and chosen item X or O
class Player
    attr_accessor :name, :item

    def initialize(name, item)
        @name = name
        @item = item
    end
end

# This class is used to represent every block of the TicTacToe board
class Block
    attr_accessor :id, :value

    def initialize(id)
        @id = id
        @value = id
    end
end

# Function to create players as per the input
def get_input_from_player(player_count, choice=nil)
    input_name = ""
    input_choice = ""
    while input_name.empty?
        puts "Player #{player_count} : Enter your name :"
        input_name = gets.chomp
    end
    while input_choice.empty?
        if !choice
            puts "Player #{player_count} : Choose your options? 'X' or 'O'"
            input_choice = gets.chomp[0]
        else
            puts "Player #{player_count} : Your item of choice is #{choice}" 
            input_choice = choice
        end
    end
    player = Player.new(input_name, input_choice) 
    player
end

# Execution of program starts here
puts "Welcome to TicTacToe Console Game"
player1 = get_input_from_player(1.to_s)
puts player1.item
if player1.item == "X"
    player2 = get_input_from_player(2.to_s, "O")
else
    player2 = get_input_from_player(2.to_s, "X")
end

# Create the board
tictactoe = TicTacToe.new(player1, player2)
puts "Follow the instructions of the game or Type 'exit' to quit"

# Loop to take input from user k
while true
    user_choice = tictactoe.update_grid(player1, 1.to_s)
    break if user_choice == "exit"
    user_choice = tictactoe.update_grid(player2, 2.to_s)
    break if user_choice == "exit"
end

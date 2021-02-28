# frozen_string_literal: false

# module pause screen
module Screen
  def self.clear
    print "\e[2J\e[f"
  end
end

class Game
  attr_reader :board

  def initialize
    @@board = [1, '|', 2, '|', 3, 4, '|', 5, '|', 6, 7, '|', 8, '|', 9]
  end

  def show_board
    a = @@board.join
    puts ''
    print a[0]
    print a[1]
    print a[2]
    print a[3]
    puts a[4]
    print a[5]
    print a[6]
    print a[7]
    print a[8]
    puts a[9]
    print a[10]
    print a[11]
    print a[12]
    print a[13]
    puts a[14]
    puts ''
  end

  def self.check_board(number, piece)
    @@board.each_with_index do |place, index|
      place == number ? @@board[index] = piece : false
    end
  end
end

class Player
  attr_reader :name, :piece

  @@all_pieces = []

  def initialize(name, piece)
    @name = name
    @piece = piece
    @placement = []
  end

  def add_piece(number)
    @placement.push(number)
    @@all_pieces.push(number)
    Game.check_board(number, @piece)
  end

  def check_score
    to_win = [[1, 2, 3], [3, 9, 6], [4, 5, 6], [7, 8, 9],
              [1, 4, 7], [2, 5, 8], [1, 5, 9], [3, 5, 7]]
    to_win.each do |win|
      if @placement.include?(win[0]) && @placement.include?(win[1]) && @placement.include?(win[2])
        return 'end'
      end
    end
  end
end

ii = 0

while ii.zero?
  board = Game.new
  Screen.clear
  puts 'Hello and welcome to Tic-Tac-Toe'
  sleep 1
  puts 'Player 1 please insert your name >>>>>>'
  player1 = Player.new(gets.chomp, 'O')
  Screen.clear
  puts 'Player 2 please insert your name >>>>>>'
  player2 = Player.new(gets.chomp, 'X')
  sleep 1
  Screen.clear
  puts "Welcome #{player1.name} & #{player2.name} lets play Tic-Tac-Toe, please see the board below"
  board.show_board

  i = 0

  while i < 9
    if i.even?
      puts "#{player1.name}, your turn, where do you want to go?"
      player1.add_piece(gets.chomp.to_i)
      if player1.check_score == 'end'
        puts "#{player1.name} you win!!!!"
        break
      end
    else
      puts "#{player2.name}, your turn, where do you want to go?"
      player2.add_piece(gets.chomp.to_i)
      if player2.check_score == 'end'
        puts "#{player2.name} you win!!!!"
        break
      end
    end
    board.show_board
    i += 1
  end

  puts 'Would you like to play again'
  ii = gets.chomp == 'yes' ? 0 : 1
end

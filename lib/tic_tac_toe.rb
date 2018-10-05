
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(gets)
  index = gets.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def valid_move?(board, index)
  if board[index] == " " && index >= 0 && index <= 8
    return true
  else
    return false
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn(board)
  puts "Please enter 1-9:"
  number = input_to_index(gets.strip)
  bool = valid_move?(board, number)
  if bool == false
    turn(board)
  end
  move(board, number, "X")
  display_board(board)
end

def turn_count(board)
  turn = 0
  board.each do |player|
    if player == "X" || player == "O"
      turn += 1
    end
  end
  return turn
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  false
end

def full?(board)
  board.each do |n|
    if n == "O" || n == "X"
      true
    else
      return false
    end
  end
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    position = won?(board)
    board[position[0]]
  end
end


#------------------------------------------


def play(board)
  index = gets.strip
  won?(board) || draw?(board) || full?(board)
end

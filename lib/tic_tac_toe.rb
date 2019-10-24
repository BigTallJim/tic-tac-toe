# frozen_string_literal: true
# TicTacToe Class deals with all the logic for playing the game
class TicTacToe
  def initialize
    @match_grid = [['', '', ''], ['', '', ''], ['', '', '']]
    @last_played = ''
  end

  def play(nought_or_cross, column, row)
    validate_move(nought_or_cross, column, row)
    make_move(nought_or_cross, column, row)
    check_response(nought_or_cross)
  end

  private

  def validate_move(nought_or_cross, column, row)
    raise "It's not your turn" if nought_or_cross == @last_played
    raise 'Row/column has to be between 1 and 3' if !column.between?(1, 3) || !row.between?(1, 3)
    raise 'This box is taken' if @match_grid[column - 1][row - 1] != ''
    raise "Move has to be an 'X' or a '0'" unless %w[X 0].include? nought_or_cross
  end

  def make_move(nought_or_cross, column, row)
    @match_grid[column - 1][row - 1] = nought_or_cross
    @last_played = nought_or_cross
  end

  def check_response(nought_or_cross)
    if check_for_win
      "#{nought_or_cross} is the Winner"
    elsif check_for_draw
      "It's a draw"
    else
      @match_grid
    end
  end

  def check_for_win
    winner = false
    m = @match_grid
    (0..2).each do |x|
      if (['X', '0'].include?(m[x][0]) && [m[x][0], m[x][1], m[x][2]].uniq.count == 1) ||
         (['X', '0'].include?(m[0][x]) && [m[0][x], m[1][x], m[2][x]].uniq.count == 1)
        winner = true
      end
    end
    unless winner
      winner = true if ['X', '0'].include?(m[0][0]) && [m[0][0], m[1][1], m[2][2]].uniq.count == 1
      winner = true if ['X', '0'].include?(m[2][0]) && [m[2][0], m[1][1], m[0][2]].uniq.count == 1
    end
    winner
  end

  def check_for_draw
    spaces = 0
    (0..2).each do |x|
      spaces += @match_grid[x].count('')
    end
    spaces == 0
  end
end

class TicTacToe
  def initialize()
    @matchGrid = [['','',''],['','',''],['','','']]
  end

  def play(xOrY,column,row)
    @matchGrid[column-1][row-1] = xOrY
    @matchGrid
  end
end
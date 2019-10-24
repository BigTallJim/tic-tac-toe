class TicTacToe
  def initialize()
    @matchGrid = [['','',''],['','',''],['','','']]
    @lastPlayed = ''
  end

  def play(noughtOrCross,column,row)
    validateMove(noughtOrCross,column,row)
    @matchGrid[column-1][row-1] = noughtOrCross
    @lastPlayed = noughtOrCross
    checkForWin() ? "Winner" : @matchGrid

  end

  private
  
  def validateMove(noughtOrCross,column,row)
    raise "It's not your turn" if noughtOrCross == @lastPlayed
    raise "Row/column has to be between 1 and 3" if !column.between?(1,3) || !row.between?(1,3)
    raise "Move has to be an 'X' or a '0'" if !['X','0'].include? noughtOrCross
  end

  def checkForWin()
    winner = false;
    m = @matchGrid
    for x in 0..2
      if (['X', '0'].include?(m[x][0]) && [m[x][0],m[x][1],m[x][2]].uniq.count == 1) || (['X','0'].include?(m[0][x]) && [m[0][x],m[1][x],m[2][x]].uniq.count == 1)
        winner = true
      end
    end
    winner
  end

end
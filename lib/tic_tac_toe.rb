class TicTacToe
  def initialize()
    @matchGrid = [['','',''],['','',''],['','','']]
  end

  def play(noughtOrCross,column,row)
    validateMove(noughtOrCross,column,row)
    @matchGrid[column-1][row-1] = noughtOrCross
    @matchGrid
  end

  private
  
  def validateMove(noughtOrCross,column,row)
    if !column.between?(1,3) || !row.between?(1,3)
      raise "Row/column has to be between 1 and 3"
    end
    if !['X','0'].include? noughtOrCross
      raise "Move has to be an 'X' or a '0'"
    end
  end
end
require "tic_tac_toe.rb"

describe TicTacToe do
  
  context "Single move, full match array" do
    it "Can place 'X' in position [1,1]" do
      expect(subject.play('X',1,1)).to eq [['X','',''],['','',''],['','','']]
    end
    it "Can place 'X' in position [1,2]" do
      expect(subject.play('X',1,2)).to eq [['','X',''],['','',''],['','','']]
    end
    it "Can place 'X' in position [1,3]" do
      expect(subject.play('X',1,3)).to eq [['','','X'],['','',''],['','','']]
    end
    it "Can place 'X' in position [2,1]" do
      expect(subject.play('X',2,1)).to eq [['','',''],['X','',''],['','','']]
    end
    it "Can place 'X' in position [3,1]" do
      expect(subject.play('X',3,1)).to eq [['','',''],['','',''],['X','','']]
    end
  end
end

# Basic Board Layout positioning
# ------------------------------
# [(1,1),(1,2),(1,3)]
# [(2,1),(2,2),(2,3)]
# [(3,1),(3,2),(3,3)]

# stored in single array as follows
# [[1,2,3],[4,5,6],[7,8,9]]
require "tic_tac_toe.rb"

describe TicTacToe do
  
  context "Single move, full match array" do
    it "Can place 'X' in position [1,1]" do
      expect(subject.play('X', 1, 1)).to eq [['X', '', ''], ['', '', ''], ['', '', '']]
    end
    it "Can place 'X' in position [1,2]" do
      expect(subject.play('X', 1, 2)).to eq [['', 'X', ''], ['', '', ''], ['', '', '']]
    end
    it "Can place 'X' in position [1,3]" do
      expect(subject.play('X', 1, 3)).to eq [['', '', 'X'], ['', '', ''], ['', '', '']]
    end
    it "Can place 'X' in position [2,1]" do
      expect(subject.play('X', 2, 1)).to eq [['', '', ''], ['X', '', ''], ['', '', '']]
    end
    it "Can place 'X' in position [3,1]" do
      expect(subject.play('X', 3, 1)).to eq [['', '', ''], ['', '', ''],['X', '', '']]
    end
    it "Can place '0' in position [3,2]" do
      expect(subject.play('0', 3, 2)).to eq [['', '', ''], ['', '', ''], ['', '0', '']]
    end
  end

  context "Single illegal move" do
    it "tries to make a move outside the board" do
      expect { subject.play('X', 4, 1) }.to raise_error("Row/column has to be between 1 and 3") 
    end
    it "move has to be an X or a 0" do
      expect { subject.play('Z', 3, 1) }.to raise_error("Move has to be an 'X' or a '0'") 
    end
  end

  context "Multiple move tests" do
    it "Plays an X, then a 0" do
      subject.play('X', 1, 1)
      expect(subject.play('0', 2, 2)).to eq [['X', '', ''], ['','0',''], ['', '', '']]
    end

    it "Plays an X, then a 0, then an X" do
      subject.play('X', 1, 1)
      subject.play('0', 2, 2)
      expect(subject.play('X', 3, 3)).to eq [['X', '', ''], ['', '0', ''], ['', '', 'X']]
    end

    it "Checks X or 0 is not played twice in a row" do
      subject.play('X', 1, 1)
      expect { subject.play('X', 2, 1) }.to raise_error("It's not your turn") 
    end
  end

  context "Winning moves" do
    it "checks for a win if top row is all X's" do
      subject.instance_variable_set(:@matchGrid,[['X', 'X', ''] ,['', '', ''], ['', '', '']])
      expect(subject.play('X', 1, 3)).to eq 'Winner'
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
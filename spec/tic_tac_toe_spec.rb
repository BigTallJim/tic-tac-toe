require "tic_tac_toe.rb"

describe TicTacToe do
  it "Can place 'X' in single 1x1 array" do
    expect(subject.play('X')).to eq ['X']
  end

end
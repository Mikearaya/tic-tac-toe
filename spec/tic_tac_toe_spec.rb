require './lib/tic_tac_toe.rb'

describe TicTacToe do
  subject { TicTacToe.new }

  context 'Initialized' do
    it { is_expected.to have_attributes(total_match: 0) }
  end

  context '#Play should' do
    it 'increase total match by 1' do
      expect { subject.play }.to change { subject.total_match }.from(0).to(1)
    end
    it 'change draw value to false' do
      subject.play
      expect(subject.draw?).to eq false
    end
  end

  context '#add_player should' do
    it 'add player successfuly' do
      expect(subject.add_players('Mikael', 'X')).to eq true
    end
    it 'throw exception when attempting to add more that 2 player' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect { subject.add_players('Mengistu', 'U') }.to raise_exception(CustomException).with_message(/Can not add/i)
    end
    it 'throw exception when attempting same symbol for player' do
      subject.add_players('Mikael', 'X')
      expect { subject.add_players('Araya', 'X') }.to raise_exception(CustomException)
        .with_message(/Symbol already used/i)
    end
  end

  context '#change_turn should' do
    it 'return current player' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.change_turn).to end_with('Turn')
    end

    it 'change turn' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.change_turn).to start_with('Araya')
      expect(subject.change_turn).to start_with('Mikael')
    end
  end

  context '#make_move should' do
    it 'complete successfuly' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.make_move('1')).to be_truthy
    end

    it 'Throw exception when move index out of range (1..9) ' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect { subject.make_move('10') }.to raise_exception(CustomException).with_message(/invalid input/i)
    end
  end

  context '#ended? should' do
    it 'return true after 9 moves' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      subject.make_move('1')
      subject.make_move('2')
      subject.make_move('3')
      subject.make_move('4')
      subject.make_move('5')
      subject.make_move('6')
      subject.make_move('7')
      subject.make_move('8')
      subject.make_move('9')

      expect(subject.ended?).to be_truthy
    end

    it 'Return false initially' do
      expect(subject.ended?).to be_falsey
    end
  end

  context '#player_won? should' do
    it 'return false initially' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.player_won?).to be_falsey
    end

    it 'return true when player wins' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')

      subject.make_move('1')
      subject.make_move('5')
      subject.make_move('2')
      subject.make_move('7')
      subject.make_move('3')
      expect(subject.player_won?).to be_truthy
    end
  end

  context '#display_winner_message should' do
    it 'return string' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.display_winner_message).to be_instance_of(String)
    end
  end

  context '#display_statstics should' do
    it 'returns String' do
      subject.add_players('Mikael', 'X')
      subject.add_players('Araya', 'O')
      expect(subject.display_statstics).to be_instance_of(String)
    end
  end
end

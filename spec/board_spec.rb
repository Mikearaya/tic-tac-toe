require './lib/board.rb'
describe Board do
  subject { Board.new }
  context 'When Initialized' do
    it { is_expected.to have_attributes(total_moves: 0) }
  end

  context 'mark_tile should' do
    it 'Return symbole on successful mark' do
      expect(subject.mark_tile(1, 'X')).to eq 'X'
      expect(subject.mark_tile(2, 'X')).not_to eq 'O'
    end
    it 'mark_tile should Increase total move by 1' do
      expect { subject.mark_tile(1, 'X') }.to change { subject.total_moves }.from(0).to(1)
      expect { subject.mark_tile(2, 'X') }.to change { subject.total_moves }.from(1).to(2)
    end
  end

  context 'mark_tile should Throw exception' do
    it 'When marking same tile twice' do
      subject.mark_tile(1, 'X')
      expect { subject.mark_tile(1, 'X') }.to raise_exception.with_message(/already marked/i)
    end
  end

  context 'reset_board should' do
    it 'reset total_moves to 0' do
      subject.mark_tile(1, 'X')
      subject.mark_tile(2, 'X')
      expect { subject.reset_board }.to change { subject.total_moves }.from(2).to(0)
    end
  end

  context 'won? should' do
    it 'return false when total moves is < 5' do
      subject.mark_tile(3, 'X')
      subject.mark_tile(4, 'X')
      subject.mark_tile(5, 'X')
      expect(subject.won?('X')).to eq false
    end

    it 'return true for [0, 1, 2]' do
      subject.mark_tile(3, 'O')
      subject.mark_tile(5, 'O')
      subject.mark_tile(0, 'X')
      subject.mark_tile(1, 'X')
      subject.mark_tile(2, 'X')
      expect(subject.won?('X')).to eq false
    end
  end
end

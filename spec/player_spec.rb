require './lib/player.rb'
describe Player do
  subject { Player.new(name.to_s, symbol.to_s) }
  context 'Initialized correctly' do
    let(:name) { 'Mikael' }
    let(:symbol) { 'X' }
    it { is_expected.to have_attributes(name: 'Mikael', symbol: 'X', wins: 0) }
  end

  context 'shod Raise exception for name' do
    let(:name) { '' }
    let(:symbol) { 'X' }
    name_error_message = /invalid name/i
    it 'When  not provided' do
      expect { subject }.to raise_exception(CustomException).with_message(name_error_message)
    end
  end

  context 'should Raise exception for symbole' do
    let(:name) { 'Mikael' }
    let(:symbol) { '' }
    symbol_error_message = /invalid symbol/i
    it 'When  not provided' do
      expect { subject }.to raise_exception(CustomException).with_message(symbol_error_message)
    end
    let(:symbol) { '9' }
    it 'When  its digit' do
      expect { subject }.to raise_exception(CustomException).with_message(symbol_error_message)
    end
    let(:symbol) { 'xx' }
    it 'When  its More than 1 character' do
      expect { subject }.to raise_exception(CustomException).with_message(symbol_error_message)
    end
  end

  context 'Update player win' do
    let(:name) { 'Mikael' }
    let(:symbol) { 'X' }
    it 'should increase from 0 to 1' do
      expect { subject.increase_win }.to change { subject.wins }.from(0).to(1)
    end
    it 'Should return the new value' do
      expect(subject.increase_win).to eq 1
    end
  end
end

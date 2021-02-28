# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Games::Logs::Matches::Ranking do
  let(:game) { create(:game) }
  let(:matches) { Games::Logs::Matches::Extract.new(game).all_matches }
  let(:match) { Games::Logs::Matches::Data.new(matches.first) }
  let(:players) { match.players }
  let(:events) { match.events_list }
  let(:ranking) { Games::Logs::Matches::Ranking.new(players, events) }

  describe '#frags' do
    it 'returns the frags list' do
      expect(ranking.frags.size).to eq(3)
    end
  end

  describe '#frags_count' do
    it 'returns the frags count' do
      expect(ranking.frags_count.size).to eq(3)
      expect(ranking.frags_count['Roman']).to eq(5)
      expect(ranking.frags_count['Diego']).to eq(1)
      expect(ranking.frags_count['<WORLD>']).to eq(1)
    end
  end

  describe '#frags?' do
    it 'returns true if player has frag' do
      expect(ranking.frags?('Roman')).to eq(true)
    end

    it 'returns false if player dont has frag' do
      expect(ranking.frags?('Astrobaldo')).to eq(false)
    end
  end

  describe '#deaths_count' do
    it 'returns the deaths count' do
      expect(ranking.deaths_count.size).to eq(7)
      expect(ranking.deaths_count['Nick']).to eq(1)
      expect(ranking.deaths_count['Marcus']).to eq(1)
      expect(ranking.deaths_count['Astrobaldo']).to eq(1)
      expect(ranking.deaths_count['Robertinho']).to eq(1)
      expect(ranking.deaths_count['Zangief']).to eq(1)
      expect(ranking.deaths_count['Osw']).to eq(1)
      expect(ranking.deaths_count['Diego']).to eq(1)
    end
  end

  describe '#deaths?' do
    it 'returns false if player has deaths' do
      expect(ranking.deaths?('Roman')).to eq(false)
    end

    it 'returns true if player dont has deaths' do
      expect(ranking.deaths?('Astrobaldo')).to eq(true)
    end
  end
end

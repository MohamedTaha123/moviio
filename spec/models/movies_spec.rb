require 'rails_helper'

RSpec.describe Movie do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end
  context 'scopes' do
    describe 'list' do
      before do
        @movie1 = FactoryBot.create(:movie)
        @movie2 = FactoryBot.create(:movie)
        @movie3 = FactoryBot.create(:movie)
      end
      it 'returns movies ordered by creation desc' do
        expect(Movie.list).to eq [@movie3, @movie2, @movie1]
      end
    end
  end
end

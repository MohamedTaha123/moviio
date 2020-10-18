require 'rails_helper'

RSpec.describe Season, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end

  context 'scopes' do
    describe 'list' do
      before do
        @season1 = FactoryBot.create(:season)
        @season2 = FactoryBot.create(:season)
        @season3 = FactoryBot.create(:season)

        @episode1 = FactoryBot.create(:episode, number: 3, season: @season1)
        @episode2 = FactoryBot.create(:episode, number: 1, season: @season1)
        @episode3 = FactoryBot.create(:episode, number: 2, season: @season1)
      end
      it 'returns seasons ordered by creation desc' do
        expect(Season.list).to eq [@season3, @season2, @season1]
      end
    end
  end
end

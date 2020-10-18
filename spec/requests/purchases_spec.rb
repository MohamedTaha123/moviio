require 'rails_helper'

RSpec.describe 'Purchase API Process' do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie) }

  describe 'User performs a purchase of new content' do
    context 'with valid attributes' do
      before do
        post api_user_movie_purchases_path(user, movie)
      end

      it 'is expected to be created' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json object for the purchase' do
        expect(json['purchasable_type']).to eq('Movie')
      end
    end
  end

  describe "Purchase an product that it is still live in the user's library" do
    let!(:previous_purchase) do
      FactoryBot.create(:purchase, user: user, purchasable: movie,
                                   purchased_at: 1.day.ago, expire_at: 1.day.from_now)
    end

    before do
      post api_user_movie_purchases_path(user, movie)
    end

    it 'is expected not to be created' do
      expect(response.status).to eq 200
    end

    it 'returns json errors' do
      message = "Can't process the purchase !!"
      expect(json['message']).to eq message
    end
  end
end

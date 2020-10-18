require 'rails_helper'

RSpec.describe Purchase do
  context 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :purchasable }
  end

  context 'scopes' do
    before do
      @movie  = FactoryBot.create(:movie)
      @user = FactoryBot.create(:user)
      @purchase = FactoryBot.create(:purchase, purchasable: @movie, user: @user)
    end
    it 'should return alive purchase' do
      expect(Purchase.alive).to include @purchase
    end
  end
end

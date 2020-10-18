require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to have_many(:purchases) }

  describe "#own_library" do
    let(:user) { FactoryBot.create(:user)}
    let(:purchasable1) { FactoryBot.create(:movie)}
    let(:purchasable2) { FactoryBot.create(:season)}

    before do

      user.purchases.create(purchasable: purchasable1,
        purchased_at: 10.days.ago,
        expire_at: 8.days.ago)

      user.purchases.create(purchasable: purchasable2,
        purchased_at: Time.current,
        expire_at: Time.current + 2.days)

    end
    it "returns all alive purchasables for the user" do
      puts user.own_library
      expect(user.own_library.map(&:purchasable)).to eq [purchasable2]
    end

  end
end
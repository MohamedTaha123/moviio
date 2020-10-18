require 'rails_helper'


RSpec.describe "User's own library endpoint" do
  let(:user) { FactoryBot.create(:user)}
  let(:purchasable1) { FactoryBot.create(:movie)}
  let(:purchasable2) { FactoryBot.create(:movie)}
  let(:purchasable3) { FactoryBot.create(:season)}
  let(:purchasable4) { FactoryBot.create(:season)}

  before do
    FactoryBot.create(:purchase, purchasable: purchasable4, user: user,
      purchased_at: 15.days.ago, expire_at: 13.days.ago)

    FactoryBot.create(:purchase, purchasable: purchasable3, user: user,
      purchased_at: 1.day.ago, expire_at: 1.day.from_now)

    FactoryBot.create(:purchase, purchasable: purchasable1, user: user,
      purchased_at: Time.current, expire_at: 2.days.from_now)

    FactoryBot.create(:purchase, purchasable: purchasable2, user: user,
      purchased_at: Time.current, expire_at: 2.days.from_now)

    get api_user_library_path(user)
  end

  it "returns the library ordered by time left to watch the content" do
  	puts json
    key = json
    expect(json.map{|i| i['id']}).to eq [purchasable3, purchasable1, purchasable2].map(&:id)
  end


end
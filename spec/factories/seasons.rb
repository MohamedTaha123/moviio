# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :season do
    title { 'MyString' }
    plot { 'MyText' }
  end
end

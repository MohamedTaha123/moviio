# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :integer          not null
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#
# Foreign Keys
#
#  season_id  (season_id => seasons.id)
#
FactoryBot.define do
  factory :episode do
    sequence(:number) { |n| n }
    title { 'MyString' }
    plot { 'MyText' }
    season
  end
end

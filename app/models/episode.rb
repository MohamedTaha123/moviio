# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
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
class Episode < ApplicationRecord
  belongs_to :season

  validates :number, presence: true, uniqueness: { scope: :season_id }
  validates_presence_of :title, :plot
end

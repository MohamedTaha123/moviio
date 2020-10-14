class SeasonSerializer < ActiveModel::Serializer
  attributes :id , :title, :plot
  has_many :episodes
end

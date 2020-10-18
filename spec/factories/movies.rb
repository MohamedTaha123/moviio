# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :movie do
    title { 'MyString' }
    plot { 'MyText' }
  end
end

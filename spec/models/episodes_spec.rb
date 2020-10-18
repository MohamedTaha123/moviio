require 'rails_helper'

RSpec.describe Episode, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:number) }

    it { is_expected.to validate_numericality_of(:number).only_integer }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end
end

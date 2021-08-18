require 'rails_helper'

describe Provider, type: :model do
  context 'relations' do
    it { is_expected.to(have_many(:people)) }
  end

  context 'validations' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:url)) }
  end
end
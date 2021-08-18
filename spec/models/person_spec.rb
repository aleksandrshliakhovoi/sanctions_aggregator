require 'rails_helper'

describe Person, type: :model do
  context 'relations' do
    it { is_expected.to(belong_to(:provider)) }
  end
end
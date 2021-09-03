# frozen_string_literal: true

require "rails_helper"

RSpec.describe UnIndividualProvider, tdd: true do
  
  let!(:un) { UnIndividualProvider.new }
  let(:validate_data) { un.handle_data_from_xml }
  let(:validate_data_instance) {validate_data.first}
  #let(:object) {  }

  describe 'validate data handling method' do
    
    it 'should change size' do
      expect(validate_data.size).to be > 100
    end

    it 'should be an array' do
      expect(validate_data.class).to eq(Array)
    end

    # it 'each element should have predefined structure' do
    #   un_indiv_person = FactoryBot.build(:rnbo_factory_person)

    #   expect(validate_data_instance.keys).to eq(un_indiv_person.keys)
    # end
  end
end
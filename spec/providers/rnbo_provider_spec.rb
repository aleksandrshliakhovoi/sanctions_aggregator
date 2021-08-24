# frozen_string_literal: true

require "rails_helper"

RSpec.describe RnboProvider, tdd: true do

  let!(:rnbo) { RnboProvider.new }
  let(:rnbo_indiv_person) { create(:rnbo_factory_person) }

  describe 'receive_data' do  

    it 'receives data' do
      expect(rnbo.receive_data('http').class).to eq(Roo::Excelx)
    end
  end

  describe 'validate individuals data' do
    let(:validate_data) { rnbo.validate_individuals }
    let(:validate_data_instance) {validate_data.first}

    it 'value size must be more than 1000' do
      expect(validate_data.size).to be > 1000
    end

    # it 'keys should be equal to factory sample' do
    #   expect(validate_data_instance.keys).to eq(rnbo_indiv_person.keys)
    # end

    it 'value class should be array' do
      expect(validate_data.class).to eq(Array)
    end

    context 'return another classes' do
      
      it 'value class shouldnt be a Hash' do
        expect(validate_data.class).not_to eq(Hash)
      end

      it 'value class shouldnt be a String' do
        expect(validate_data.class).not_to eq(String)
      end
    end
  end
end
# frozen_string_literal: true

require 'open-uri'
class UnIndividualProvider < BaseProvider
  PROVIDER_ID = 1

  def handle_data_from_xml
    un_individual_persons = []

    if check_persons
      individuals_dataset.each do |individual|
        sanction_person = {
          first_name:         individual.xpath('./FIRST_NAME').text,
          last_name:          [
                                individual.xpath('./SECOND_NAME').text,
                                individual.xpath('./THIRD_NAME').text,
                              ],
          citizenship:        individual.xpath('./NATIONALITY').text,
          birthday:           individual.xpath('./INDIVIDUAL_DATE_OF_BIRTH').text,
          provider_id:        PROVIDER_ID,
          end_sanctions_time: nil
        }
        un_individual_persons << sanction_person
      end
    end
    un_individual_persons
  end

  private
    def check_persons
      find_all_first_name = receive_data.search('//INDIVIDUAL//FIRST_NAME').size
      all_individual_persons = individuals_dataset.size

      find_all_first_name == all_individual_persons ? true : false
    end

    def receive_data
      Nokogiri::XML.parse(URI.open('https://scsanctions.un.org/resources/xml/en/consolidated.xml'))
    end

    def individuals_dataset
      receive_data.xpath('//INDIVIDUAL')
    end
end

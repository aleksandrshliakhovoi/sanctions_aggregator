# frozen_string_literal: true

class RnboProvider < BaseProvider
  PROVIDER_NAME = "РНБО"

  @@rnbo_sanction_persons = []

  def receive_data(url)
    @file = Roo::Spreadsheet.open("./db/sanctions.xlsx")
  end

  def validate_individuals
    sanctions_individuals = receive_data("url").sheet("Фізичні особи")
    sheet_header_arr = sanctions_individuals.row(1)

    sheet_header_column = {
      end_date: sheet_header_arr[8],
      ukr_name: sheet_header_arr[9],
      orig_name: sheet_header_arr[10],
      alter_name: sheet_header_arr[11],
      birth_date: sheet_header_arr[12],
      citezenship: sheet_header_arr[13]
    }

    if sheet_header_column[:end_date]    ==     "Дата закінчення обмеження" &&
       sheet_header_column[:ukr_name]    ==     "Назва укр." &&
       sheet_header_column[:orig_name]   ==     "Назва ориг." &&
       sheet_header_column[:alter_name]  ==     "Назва альт." &&
       sheet_header_column[:birth_date]  ==     "Дата народження" &&
       sheet_header_column[:citezenship] ==     "Громадянство"
      sanctions_individuals.each do |row|
         next if row[0] == "row"
         sanction_individual_person = {
           first_name:         [
                                handle_name(row[9], 1),
                                handle_name(row[9], 2),
                                handle_name(row[10], 1),
                                handle_name(row[10], 2),
                                handle_name(row[11], 1)
                               ],
           last_name:          [
                                handle_name(row[9], 0),
                                handle_name(row[10], 0),
                                handle_name(row[11], 0)
                               ],
           citizenship:        row[13],
           birthday:           date_handler(row[12]),
           source_base:        PROVIDER_NAME,
           end_sanctions_time: date_handler(row[8])
           }
         @@rnbo_sanction_persons << sanction_individual_person if sanction_individual_person.present?
       end
    else
      puts "structure wrong"
    end
  end

  # def validate_entities
  #   sanctions_entity = @file.sheet("Юридичні особи")
  # end

  def save_persons
    BaseProvider.save_to_db(@@rnbo_sanction_persons)
  end

  private
    def date_handler(row_value)
      row_value.to_datetime if row_value.present?
    end

    def handle_name(row_value, el_number)
      row_value.split(" ")[el_number] if row_value.present?
    end
end

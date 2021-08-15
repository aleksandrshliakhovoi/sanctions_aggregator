# frozen_string_literal: true

class RnboProvider < BaseProvider
  PROVIDER_NAME = "РНБО"

  def receive_data(url)
    @file = Roo::Spreadsheet.open("./db/sanctions.xlsx")
  end

  def validate_individuals
    sanctions_individuals = receive_data("url").sheet("Фізичні особи")
    sheet_header_arr = sanctions_individuals.row(1)

    if sheet_header_arr[8] ==      "Дата закінчення обмеження" &&
       sheet_header_arr[9] ==      "Назва укр." &&
       sheet_header_arr[10] ==     "Назва ориг." &&
       sheet_header_arr[11] ==     "Назва альт." &&
       sheet_header_arr[12] ==     "Дата народження" &&
       sheet_header_arr[13] ==     "Громадянство"
      sanctions_individuals.each do |row|
         next if row[0] == "row"
         sanction_individual_person = {
           first_name:         row[9].split(" ")[1],
           last_name:          row[9].split(" ")[0],
           citizenship:        row[13],
           birthday:           date_handler(row[12]),
           source_base:        PROVIDER_NAME,
           end_sanctions_time: date_handler(row[8])
           }
         pp sanction_individual_person
         BaseProvider.save_to_db(sanction_individual_person)
       end
    else
      puts "structure wrong"
    end
  end

  # def validate_entities
  #   sanctions_entity = @file.sheet("Юридичні особи")
  # end

  private
    def date_handler(row_value)
      row_value != "" || nil ? row_value.to_date : nil
    end
end

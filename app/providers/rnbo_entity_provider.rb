# frozen_string_literal: true

class RnboEntityProvider < BaseProvider
  PROVIDER_ID = 2

  def validate_entities
    rnbo_sanction_persons = []
    receive_data_hash = receive_data

    if check_entities_file?(table_header_hash)
      receive_data_hash.each do |row|
        next if row[0] == 'row'
        sanction_entity_person = {
          first_name:         [ row[9], row[10], row[11] ],
          last_name:          nil,
          citizenship:        row[14],
          birthday:           nil,
          provider_id:        PROVIDER_ID,
          end_sanctions_time: date_handler(row[8])
        }
        rnbo_sanction_persons << sanction_entity_person if sanction_entity_person.present?
      end
    else
      puts 'error during check'
    end
    rnbo_sanction_persons
  end

  private
    def date_handler(row_value)
      row_value.to_datetime if row_value.present?
    end

    def table_header_hash
      table_header_col = receive_data.row(1)

      {
        end_date:    table_header_col[8],
        ukr_name:    table_header_col[9],
        orig_name:   table_header_col[10],
        alter_name:  table_header_col[11],
        citizenship: table_header_col[14]
      }
    end

    def check_entities_file?(table_header_hash)
      if  table_header_hash[:end_date]    ==     'Дата закінчення обмеження' &&
          table_header_hash[:ukr_name]    ==     'Назва укр.' &&
          table_header_hash[:orig_name]   ==     'Назва ориг.' &&
          table_header_hash[:alter_name]  ==     'Назва альт.' &&
          table_header_hash[:citizenship] ==     'Місце діяльності'
        true
      else
        puts 'wrong header'
      end
    end

    def receive_data
      file = Roo::Spreadsheet.open('./db/sanctions.xlsx')

      file.sheet('Юридичні особи')
    end
end

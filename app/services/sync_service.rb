# frozen_string_literal: true

class SyncService
  def call
    file =  Roo::Spreadsheet.open("./db/sanctions.xlsx")
    sheet = file.sheet(file.sheets.first)
    sheet.each do |row|
      next if row[0] == "row"

      full_name = row[9]
      last_name, first_name = full_name.split(" ")
      birthday = row[12]
      citizenship = row[13]
      end_sanctions_time = row[8]

      Person.find_or_create_by(
        first_name: first_name,
        last_name: last_name,
        birthday: birthday,
        citizenship: citizenship,
        end_sanctions_time: end_sanctions_time
      )
    end
  end
end

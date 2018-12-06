class Attendance < ApplicationRecord

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = %w(date_at name account department rule times_count work_hours approval status calibration start_type start_work start_sta end_type end_work end_sta)
    daily = spreadsheet.sheet(0)
    (4..daily.last_row).each do |i|
      row = Hash[[header, daily.row(i)[0,16]].transpose]
      %w(start_type start_sta end_type end_sta).each { |k| row.delete(k) }
      record = find_by(date_at: row["date_at"], name: row["name"]) || new
      record.attributes = row.to_hash
      record.save!
    end
  end
end

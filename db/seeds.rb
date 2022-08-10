WEEK_DATES_2022 = {
  1 => { start_date: Date.parse("14-08-2022"), end_date: Date.parse("30-08-2022")},
  1 => { start_date: Date.parse("31-08-2022"), end_date: Date.parse("06-09-2022")},
  2 => { start_date: Date.parse("07-09-2022"), end_date: Date.parse("13-09-2022")},
  3 => { start_date: Date.parse("14-09-2022"), end_date: Date.parse("20-09-2022")},
  4 => { start_date: Date.parse("21-09-2022"), end_date: Date.parse("27-09-2022")},
  5 => { start_date: Date.parse("28-09-2022"), end_date: Date.parse("04-10-2022")},
  6 => { start_date: Date.parse("05-10-2022"), end_date: Date.parse("11-10-2022")},
  7 => { start_date: Date.parse("12-10-2022"), end_date: Date.parse("18-10-2022")},
  8 => { start_date: Date.parse("19-10-2022"), end_date: Date.parse("25-10-2022")},
  9 => { start_date: Date.parse("26-10-2022"), end_date: Date.parse("01-11-2022")},
  10 => { start_date: Date.parse("02-11-2022"), end_date: Date.parse("08-11-2022")},
  11 => { start_date: Date.parse("09-11-2022"), end_date: Date.parse("15-11-2022")},
  12 => { start_date: Date.parse("16-11-2022"), end_date: Date.parse("22-11-2022")},
  13 => { start_date: Date.parse("23-11-2022"), end_date: Date.parse("29-11-2022")},
  14 => { start_date: Date.parse("30-11-2022"), end_date: Date.parse("06-12-2022")},
  15 => { start_date: Date.parse("07-12-2022"), end_date: Date.parse("13-12-2022")},
  16 => { start_date: Date.parse("14-12-2022"), end_date: Date.parse("20-12-2022")},
  17 => { start_date: Date.parse("21-12-2022"), end_date: Date.parse("27-12-2022")},
  18 => { start_date: Date.parse("28-12-2022"), end_date: Date.parse("03-01-2023")},
  19 => { start_date: Date.parse("04-01-2023"), end_date: Date.parse("10-01-2023")},
}.freeze

WEEK_DATES_2022.each do |number, dates|
  puts "dates: #{dates}"
  Week.find_or_create_by(
    number: number,
    start_date: dates[:start_date],
    end_date: dates[:end_date]
  )
end
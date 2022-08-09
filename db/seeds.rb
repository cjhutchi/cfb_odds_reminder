WEEK_DATES_2022 = {
  1 => Date.parse("30-08-2022"),
  2 => Date.parse("06-09-2022"),
  3 => Date.parse("13-09-2022"),
  4 => Date.parse("20-09-2022"),
  5 => Date.parse("27-09-2022"),
  6 => Date.parse("04-10-2022"),
  7 => Date.parse("11-10-2022"),
  8 => Date.parse("18-10-2022"),
  9 => Date.parse("25-10-2022"),
  10 => Date.parse("01-11-2022"),
  11 => Date.parse("08-11-2022"),
  12 => Date.parse("15-11-2022"),
  13 => Date.parse("22-11-2022"),
  14 => Date.parse("29-11-2022"),
  15 => Date.parse("06-12-2022"),
  16 => Date.parse("13-12-2022"),
  17 => Date.parse("20-12-2022"),
  18 => Date.parse("27-12-2022"),
  19 => Date.parse("03-01-2023"),
  20 => Date.parse("10-01-2023"),
}.freeze

WEEK_DATES_2022.each do |number, end_date|
  Week.find_or_create_by(number: number, end_date: end_date)
end
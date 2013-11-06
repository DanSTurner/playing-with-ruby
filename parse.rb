require 'csv'

file = File.read('data.csv')
data = CSV.parse(file)

clean = data.slice((4..224))

puts "HEADERS!"
puts clean[0]

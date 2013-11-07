require 'csv'

file = File.read('data.csv')
data = CSV.parse(file)

clean = data.slice((5..58))
clean = clean.transpose.slice((0..5))
clean = clean.transpose

# puts "HEADERS!"

# puts clean[0].inspect

# puts clean [1]

# clean[0].slice(0..3).each { |cell| print "#{cell} | " }
# print "\n"
# clean[1].slice(0..3).each { |cell| print "#{cell} | " }

# find the max length in each column for printing purposes.
# transpose converts rows to columns.
columns_max_length = clean.transpose.map {    # now we've got columns!
  |csv_column| csv_column
    .reject { |cell| cell.nil? }              # removes empty cells
    .map { |cell| cell.length }               # finds cell lengths for math
    .max                                      # retuns the highest number length
  }


clean.each { |row|
  row.each_index { |index|
    column_width = columns_max_length[index]
    word_length = row[index].length
    print "|  #{row[index]}#{' ' * (column_width - word_length)} "
  }
  print " |\n"
}
require 'csv'

file = File.read('data.csv')
data = CSV.parse(file)

clean = data.slice((4..224))

puts "HEADERS!"

puts clean[0].inspect

puts clean [1]

clean[0].slice(0..3).each { |cell| print "#{cell} | " }
print "\n"
clean[1].slice(0..3).each { |cell| print "#{cell} | " }

#doing the below stuff to set up a hash of cell widths so the program can spit out everything on even cell widths. will use how much the cell value length is less than that and add spacing

#first attempt
def set_cell_widths(clean)
  cell_widths = Hash.new(0)
  clean.each do |row|
    row.each_with_index { |cell, index| cell_widths[index] = cell.length if cell && cell.length > cell_widths[index] }
  end
  return cell_widths
end

#second attempt
def set_cell_widths_2(clean)
  cell_widths = Hash.new(0)
  clean.each { |row| update_max_widths_per_row(row, cell_widths) }
  return cell_widths
end

def update_max_widths_per_row(row, cell_widths)
  row.each_with_index { |cell, index| cell_widths[index] = cell.length if cell && cell.length > cell_widths[index] }
end

#third attempt
(0...clean[0].length).map { |col| clean.map{ |row| row[col] ? row[col].length : 0 }.max }

# for each column uses the max_word_length_for_col to return the integer
(0...clean[0].length).map { |col| max_word_length_for_col(col) }

# returns the max length for each cell in a column
def max_word_length_for_col(col)
  clean.map { |row| row[col] ? row[col].length : 0 }.max
end


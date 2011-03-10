if ARGV.size != 2
  puts "Must provide file name and phrase"
  exit(FALSE)
end

(filename, phrase) = ARGV

File.open(filename) { |file|
  line_number = 0
  file.each_line {|line|
    line_number += 1
    if (line =~ /#{phrase}/io) != nil
      print line_number, ': ', line
    end
  }
}


if ARGV.size != 2
  puts "Must provide file name and phrase"
  exit(FALSE)
end

(filename, phrase) = ARGV

File.open(filename) { |file|
  file.each_line {|line|
    if (line =~ /#{phrase}/io) != nil
      puts line
    end
  }
}


#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---

class ActsAsCsv

  class CsvRow
    attr_accessor :fieldnames, :fields
    
    def initialize(rownames, row)
      @fieldnames = rownames
      @fields = row
    end

    def method_missing name, *args
      column = name.to_s
      @fields[@fieldnames.index(column)]
    end

  end

  def self.acts_as_csv
    
    define_method 'read' do
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
    
    define_method "headers" do
      @headers
    end
    
    define_method "csv_contents" do
      @result
    end
    
    define_method 'initialize' do
      @result = []
      read
    end
    
    define_method :each do |&block|
      @result.each { |row|
        csvrow = CsvRow.new(@headers, row)
        block.call csvrow
      }
    end
  end
end

class RubyCsv < ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row|
  puts [row.first, row.last, row.country].join(' ')
}

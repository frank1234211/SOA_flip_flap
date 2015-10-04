# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  require 'yaml'

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    # columns_names = [] Unused variable - columns_names & column_names
    # lines = [] Unnecessary since you define lines on next line
    lines = tsv.split("\n")
    column_names = lines[0].split("\t")
    column_names.map!(&:chomp) # You can do this instead
    lines.shift
    @data = lines.map do |line|
      values = line.split("\t")
      element = {} # This is preferred to Hash.new
      column_names.each_index do |index|
        element["#{column_names[index]}"] = values[index].chomp
      end
      element
    end # Missing this 'end'
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    column_names = @data[0].keys
    tsv_string = column_names.join("\t") + "\n"
    # column_names.each { |column_name| tsv_string.concat(column_name + "\t") }
    @data.each_index do |index| # Use do-end for multiline block
      temp_map = data[index]
      values = temp_map.map { |_key, value| value }.join("\t")
      # Using '_key' because 'key' is not used inside block
      tsv_string.concat(values + "\n")
    end
    # Avoid return keyword
    tsv_string
  end
end

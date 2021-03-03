require_relative './error_checkers.rb'

class File
  include CheckErrors
  attr_reader :path, :file_lines, :file_lines_total, :errors_array
  def initialize(path)
    @path = path
    @file_lines = []
    @file_lines_total = 0
    @errors_array = []
  end

  def spread_file
    @file_lines = File.readlines(@path)
    @file_lines_total = file_lines.length
  end
end

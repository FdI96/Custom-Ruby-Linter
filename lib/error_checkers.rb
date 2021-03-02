require 'strscan'

module CheckErrors
  def check_trailing_spaces
    a = false
    @file_lines.each_with_index do |line, i|
      line[-2] == ' ' ? @errors_array << "line:#{i + 1}:#{line.length - 1} => Error - Trailing White Space Detected" : a
    end
  end

  def check_wrong_identation
    reserved = %w[module class def do if unless else]
    a = false
    identation_level = 0
    current_identation = 0
    @file_lines.each_with_index do |line, i|
      next if line.include?('puts') || line.strip.empty?
      current_identation = line.index(/\w/)
      identation_level -= 1 if line.include?('end')
      current_identation != identation_level * 2 ? @errors_array << "line:#{i + 1}:#{current_identation} => Error - Wrong Identation" : a
      identation_level += 1 if reserved.include?((line.strip.split(' ')).first)
    end
  end

  def check_line_length
    msg = 'Reduce characters per line max 120'
    a = false
    @file_lines.each_with_index do |line, i|
      line.length > 120 ? @errors_array << "line:#{i + 1}:120 => Error - #{msg}" : a
    end
  end
end

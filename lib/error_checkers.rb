module CheckErrors
  def check_trailing_spaces
    a = false
    @file_lines.each_with_index do |line, i|
      line[-2] == ' ' ? @errors_array << "line:#{i + 1}:#{line.length - 1} => Error - Trailing White Space Detected" : a
    end
  end

  def check_wrong_identation
    reserved = %w[module class def do if unless else]
    msg = '=> Error - Wrong Identation'
    a = false
    identation_level = 0
    current_identation = 0
    @file_lines.each_with_index do |line, i|
      next if line.include?('puts') || line.strip.empty?

      current_identation = line.index(/\w/)
      identation_level -= 1 if line.include?('end')
      current_identation != identation_level * 2 ? @errors_array << "line:#{i + 1}:#{current_identation} #{msg} " : a
      identation_level += 1 if reserved.include?(line.strip.split(' ').first)
    end
  end

  def check_line_length
    msg = 'Reduce characters per line max 120'
    a = false
    @file_lines.each_with_index do |line, i|
      line.length > 120 ? @errors_array << "line:#{i + 1}:120 => Error - #{msg}" : a
    end
  end

  def check_last_empty_line
    n = false
    msg = '=> Error - Final newline missing'
    @file_lines.last != @file_lines.last.strip.empty? ? @errors_array << "line:#{@file_lines_total + 1}:0 #{msg}" : n
  end

  def check_empty_lines
    a = %w[def class module]
    n = false
    msg = '=> Error - Inadequate empty line'
    @file_lines.each_with_index do |line, i|
      if a.include?(line.strip.split(' ').first)
        @file_lines[i + 1].strip.empty? ? @errors_array << "line:#{i + 2}:0 #{msg}" : n
      end
    end
  end
end

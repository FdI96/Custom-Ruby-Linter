module CheckErrors
  def check_trailing_spaces
    @file_lines.each_with_index do |line, i|
      line[-2] == ' ' ? @errors_array << "line:#{i+1}:#{line.length-1} => Error - Trailing White Space Detected" : true
    end
  end

  def check_wrong_identation
    identantion_point = 0
    @file_lines.each_with_index do |line, i|
       
    end
  end
end
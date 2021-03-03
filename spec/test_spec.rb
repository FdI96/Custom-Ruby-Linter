require_relative '../lib/reader.rb'
require_relative '../lib/error_checkers.rb'
require_relative '../test.rb'
require_relative '../test_two.rb'

describe File do
  let(:file_correct) { File.new('test.rb') }
  let(:file_incorrect) { File.new('test_two.rb') }

  describe '#spread_file' do
    it 'Convert a file in an array and store the amount of lines of it.' do
      expect(file_correct.spread_file).not_to eql(nil)
    end
  end

  describe '#check_trailing_spaces' do
    it 'Check the trailing spaces at the end of a line.' do
      expect(file_correct.check_trailing_spaces).to eql([])
    end

    it 'Check the trailing spaces at the end of a line.' do
      expect(file_correct.check_trailing_spaces).not_to eql(3)
    end 
  end

  describe '#check_wrong_identation' do
    it 'Check if the identation made is wrong.' do
      expect(file_correct.check_wrong_identation).to eql([])
    end

    it 'Check if the identation made is wrong.' do
      expect(file_correct.check_wrong_identation).not_to eql('string')
    end
  end

  describe '#check_line_length' do
    it 'Check the length of the line' do
      expect(file_correct.check_line_length).to eql([])
    end

    it 'Check the length of the line' do
      expect(file_correct.check_line_length).not_to eql(false)
    end
  end

  describe '#check_last_empty_line' do
    it 'Check if the last line is empty' do
      expect(file_correct.check_last_empty_line).to eql([])
    end

    it 'Check if the last line is empty' do
      expect(file_correct.check_last_empty_line).not_to eql(true)
    end
  end

  describe '#check_empty_lines' do
    it 'Check if there are empty lines after reserved words' do
      expect(file_correct.check_empty_lines).to eql([])
    end

    it 'Check if there are empty lines after reserved words' do
      expect(file_correct.check_empty_lines).not_to eql({})
    end
  end
end
# encoding: utf-8

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/test.rb"
require_relative "lib/test_result_printer.rb"
require_relative 'lib/data_reader'

name = ARGV[0]
name = name.dup.encode("UTF-8") if (Gem.win_platform? && ARGV[0])
name = "Таинственная Персона" if name == nil

puts "Добрый день, #{name}! Тест поможет определить ваш уровень коммуникабельности.
Для этого необходимо правдиво ответить на следующие вопросы."

data_reader = DataReader.new
questions_from_data = data_reader.read_data_from_file("#{File.dirname(__FILE__)}/data/questions.txt")

abort "Файл с вопросами теста не найден!" if !questions_from_data

test = Test.new
test.questions = questions_from_data

test.next_question until test.finished?

result_printer = TestResultPrinter.new
res_index = result_printer.calculate_result_index(test)
result_from_data = data_reader.read_data_from_file("#{File.dirname(__FILE__)}/data/result#{res_index}.txt")

abort "Файл с результатом теста не найден!" if !result_from_data

result_printer.result = result_from_data
result_printer.print_result(test)

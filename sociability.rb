require_relative "test.rb"
require_relative "test_result_printer.rb"


name = ARGV[0]

if (Gem.win_platform? && ARGV[0])
  name = name.dup.encode("UTF-8")
end

if name == nil
  name = "Таинственная Персона"
end

puts "Добрый день, #{name}! Тест поможет определить ваш уровень коммуникабельности.
Для этого необходимо правдиво ответить на следующие вопросы."

test = Test.new
result_printer = TestResultPrinter.new

until test.finished?
  test.next_question
end

result_printer.print_result(test)

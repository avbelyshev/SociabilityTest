# encoding: utf-8

class TestResultPrinter
  attr_reader :result_index

  attr_accessor :result

  def initialize
    @result_index = nil
    @result = []
  end

  def calculate_result_index(test)
    result_index =
      case test.points
      when 30..32 then 0
      when 25..29 then 1
      when 19..24 then 2
      when 14..18 then 3
      when 9..13 then 4
      when 4..8 then 5
      else 6
      end
  end

  def print_result(test)
    puts "\nВаш результат теста (#{test.points} баллов):"
    puts @result
  end
end

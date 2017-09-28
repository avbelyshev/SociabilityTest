# encoding: utf-8

class Test
  attr_reader :points

  attr_accessor :questions

  def initialize
    @questions = []
    @points = 0
    @question = 0
  end

  def next_question
    puts @questions[@question]

    user_input = nil

    until (user_input == 1 or user_input == 2 or user_input == 3)
      puts "введите '1' или '2' или '3' и нажмите Enter"
      user_input = STDIN.gets.chomp.to_i
    end

    @points += 2 if (user_input == 1)
    @points += 1 if (user_input == 3)

    @question += 1
  end

  def finished?
    @question >= @questions.size
  end
end

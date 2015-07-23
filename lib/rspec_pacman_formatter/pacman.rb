require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

module RspecPacmanFormatter
  class Pacman < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register(
      self, :start, :close, :example_started,
      :example_passed, :example_failed, :example_pending
    )

    attr_accessor :progress_line, :failed

    def initialize(*args)
      super
      @progress_line = ''
      @failed = 0
    end

    def start(notification)
      puts 'GAME STARTED'
      @progress_line = '•' * notification.count
    end

    def example_started(_)
      step('ᗧ')
    end

    def example_passed(_)
      step('.')
    end

    def example_failed(_)
      @failed += 1
      step('ᗣ')
    end

    def example_pending(_)
      step('*')
    end

    def close(_)
      puts 'GAME OVER' if @failed > 0
    end

    private

    def step(character)
      @progress_line = @progress_line.sub(/ᗧ|•/, character)
      print format("%s\r", @progress_line)
    end
  end
end

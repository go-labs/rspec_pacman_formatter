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
      @cols = 0
      @notification = 0
      @repetitions = 0
    end

    def start(notification)
      puts 'GAME STARTED'
      @cols = Integer(`tput cols`)
      @notification = notification.count
      update_progress_line
    end

    def example_started(_)
      step(Characters::PACMAN)
    end

    def example_passed(_)
      step('.')
    end

    def example_failed(_)
      @failed += 1
      step(Characters.random_ghost)
    end

    def example_pending(_)
      step('*')
    end

    def close(_)
      puts 'GAME OVER'.red if @failed > 0
    end

    def update_progress_line
      if @notification > @cols
        if (@notification / @cols).eql?(@repetitions)
          @progress_line = Characters::PACDOT * (@notification - (@cols * @repetitions))
          return
        end
        @progress_line = Characters::PACDOT * @cols
        return
      end
      @progress_line = Characters::PACDOT * @notification
    end

    private

    def step(character)
      @progress_line = @progress_line.sub(/#{Regexp.quote(Characters::PACMAN)}|#{Regexp.quote(Characters::PACDOT)}/, character)
      print format("%s\r", @progress_line)
      if @progress_line[-1] =~ /ᗣ|\./
        @repetitions += 1
        puts
        update_progress_line
      end
    end
  end
end

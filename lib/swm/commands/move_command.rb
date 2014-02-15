module Swm
  class MoveCommand

    Command.register("move", self)

    def self.run(options)
      new(options).run
    end

    def self.print_help
      puts <<-EOF
Usage: swm move <options>
Options:
  --x: X-coord of top-left corner in percent of screen
  --y: Y-ccord of top-left corner in percent of screen
Examples:
  Move window to top left corner of screen
    swm resize --x 0 --y 0
      EOF
    end

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      x_percent = options[:x]
      y_percent = options[:y]

      screen_dimensions = Screen.dimensions
      window = Swm::Window.current

      x = (screen_dimensions[0] * x_percent / 100.0).to_i
      y = (screen_dimensions[1] * y_percent / 100.0).to_i

      window.move x, y
    end

  end
end

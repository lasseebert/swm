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
  --x: Percentage of free screen width
  --y: Percentage of free screen height
Examples:
  Center the window
    swm resize --x 50 --y 50
  Move the window to the top-right corner
    swm resize --x 100 --y 0

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

      x = ((screen_dimensions[0] - window.width) * x_percent / 100.0).to_i
      y = ((screen_dimensions[1] - window.height) * y_percent / 100.0).to_i

      window.move x, y
    end

  end
end

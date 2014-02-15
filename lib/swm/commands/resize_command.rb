module Swm
  class ResizeCommand

    Command.register("resize", self)

    def self.run(options)
      new(options).run
    end

    def self.print_help
      puts <<-EOF
Usage: swm resize <options>
Options:
  --x:      X-coord of top-left corner in percent of screen
  --y:      Y-ccord of top-left corner in percent of screen
  --width:  Width in percent of screen
  --height: Height in percent of screen
Examples:
  Make window fill 80 percent of screen in each dimension with a 10 percent margin:
    swm resize --x 10 --y 10 --width 80 --height 80
      EOF
    end

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      x_percent = options[:x]
      y_percent = options[:y]
      width_percent = options[:width]
      height_percent = options[:height]

      screen_dimensions = Screen.dimensions
      window = Swm::Window.current

      x = y = width = height = nil
      x =       (screen_dimensions[0] * x_percent / 100.0).to_i
      y =       (screen_dimensions[1] * y_percent / 100.0).to_i
      width =   (screen_dimensions[0] * width_percent / 100.0).to_i
      height =  (screen_dimensions[1] * height_percent / 100.0).to_i

      window.set x, y, width, height
    end

  end
end

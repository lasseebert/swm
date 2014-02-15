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
  --left:   (Optional) Sets a left margin of the screen
  --right:  (Optional) Sets a right margin of the screen
  --top:    (Optional) Sets a top margin of the screen
  --bottom: (Optional) Sets a bottom margin of the screen
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
      screen_dimensions = Screen.dimensions
      rect = [0, 0, screen_dimensions[0], screen_dimensions[1]]
      set_offset(rect)
      resize_in_rect(rect)
    end

    private

    def set_offset(rect)
      rect[0] += options[:left] || 0
      rect[2] -= options[:left] || 0
      rect[1] += options[:top] || 0
      rect[3] -= options[:top] || 0
      rect[2] -= options[:right] || 0
      rect[3] -= options[:bottom] || 0
    end

    def resize_in_rect(rect)
      x_percent = options[:x]
      y_percent = options[:y]
      width_percent = options[:width]
      height_percent = options[:height]

      x =       (rect[0] + rect[2] * x_percent / 100.0).to_i
      y =       (rect[1] + rect[3] * y_percent / 100.0).to_i
      width =   (rect[2] * width_percent / 100.0).to_i
      height =  (rect[3] * height_percent / 100.0).to_i

      window = Window.current
      window.set x, y, width, height
    end

  end
end

module Swm
  class MoveCommand
    def initialize(command_options = {}, global_options = {})
      @command_options = command_options
      @global_options = global_options
    end

    def run
      window = Swm::Window.current

      x_percentage = get_x_percentage
      y_percentage = get_y_percentage

      screen_dimensions = Screen.dimensions

      x = y = nil
      x = ((screen_dimensions[0] - window.width) * x_percentage / 100.0).to_i if x_percentage
      y = ((screen_dimensions[1] - window.height) * y_percentage / 100.0).to_i if y_percentage

      window.move x, y
    end

    def get_x_percentage
      get_placement_percentage :x, {
        left: 0,
        middle: 50,
        right: 100
      }
    end

    def get_y_percentage
      get_placement_percentage :y, {
        top: 0,
        middle: 50,
        bottom: 100
      }
    end

    def get_placement_percentage(axis, constants)
      raw_value = @command_options[axis]
      return nil if raw_value.nil?
      if value = constants[raw_value.to_sym]
        value
      elsif /(\d+(\.\d+)?)\%/ =~ raw_value
        $1.to_f
      else
        raise "Unknown placement option: #{raw_value}. Valid options are percentages (e.g. 30%) and [#{constants.map{|x| x.first.to_s}.join(' ')}]"
      end
    end
  end
end

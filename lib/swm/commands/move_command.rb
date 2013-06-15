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
      window.move_x_percentage x_percentage if x_percentage
      window.move_y_percentage y_percentage if y_percentage
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
        throw "Unknown placement option: #{raw_value}"
      end
    end
  end
end

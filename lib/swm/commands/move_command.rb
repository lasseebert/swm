module Swm
  class MoveCommand < Command

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

  end
end

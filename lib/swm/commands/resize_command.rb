module Swm
  class ResizeCommand < Command

    def run
      x1 = get_x_percentage :x1
      x2 = get_x_percentage :x2
      y1 = get_y_percentage :y1
      y2 = get_y_percentage :y2

      screen_dimensions = Screen.dimensions
      window = Swm::Window.current

      x = y = width = height = nil
      x =       (screen_dimensions[0] * x1 / 100.0).to_i if x1
      y =       (screen_dimensions[1] * y1 / 100.0).to_i if y1
      width =   (screen_dimensions[0] * x2 / 100.0).to_i - (x || window.pos_x) if x2
      height =  (screen_dimensions[1] * y2 / 100.0).to_i - (y || window.pos_y) if y2

      window.set x, y, width, height
    end

  end
end

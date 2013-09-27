module Swm
  class Window
    def self.current
      Window.new `xdotool getwindowfocus`.to_i
    end

    def initialize(id)
      @id = id
    end

    def width
      xwininfo_integer_property "Width"
    end

    def height
      xwininfo_integer_property "Height"
    end

    def pos_x
      xwininfo_integer_property "Absolute upper-left X"
    end

    def pos_y
      xwininfo_integer_property "Absolute upper-left Y"
    end

    def move(x, y)
      x ||= pos_x
      y ||= pos_y
      set x, y, width, height
    end

    def set(x, y, w, h)
      x ||= pos_x
      y ||= pos_y
      w ||= width
      h ||= height
      exec = "wmctrl -i -r #{@id} -e 0,#{x},#{y},#{w},#{h}"
      clear_cache
    end

    private

    ##
    # xwininfo will tell stuff about the requested window
    #
    # Sample output:
    #
    # xwininfo: Window id: 0x3c00862 "xwininfo -id 62916706"
    #
    #  Absolute upper-left X:  1
    #  Absolute upper-left Y:  52
    #  Relative upper-left X:  0
    #  Relative upper-left Y:  0
    #  Width: 992
    #  Height: 596
    #  Depth: 32
    #  Visual: 0x6c
    #  Visual Class: TrueColor
    #  Border width: 0
    #  Class: InputOutput
    #  Colormap: 0x3c00005 (not installed)
    #  Bit Gravity State: NorthWestGravity
    #  Window Gravity State: NorthWestGravity
    #  Backing Store State: NotUseful
    #  Save Under State: no
    #  Map State: IsViewable
    #  Override Redirect State: no
    #  Corners:  +1+52  -927+52  -927-432  +1-432
    #  -geometry 110x33+-7+24
    #
    def xwininfo
      @xwininfo ||= `xwininfo -id #{@id}`
    end

    def xwininfo_integer_property(name)
      /#{name}: +(\d+)/.match(xwininfo)[1].to_i
    end

    def clear_cache
      @xwininfo = nil
    end
  end
end

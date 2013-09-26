module Swm
  class Command
    def initialize(command_options = {}, global_options = {})
      @command_options = command_options
      @global_options = global_options
    end

    def run
      raise "Override in sub derived class"
    end

    def get_x_percentage(name = :x)
      get_placement_percentage name, {
        left: 0,
        middle: 50,
        right: 100
      }
    end

    def get_y_percentage(name = :y)
      get_placement_percentage name, {
        top: 0,
        middle: 50,
        bottom: 100
      }
    end

    def get_placement_percentage(name, constants)
      raw_value = @command_options[name]
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

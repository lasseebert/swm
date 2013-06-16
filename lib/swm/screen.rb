module Swm
  class Screen
    def self.dimensions
      @dimenesions ||= /(\d+x\d+) pixels/.match(`xdpyinfo | grep dimensions`)[1].split('x').map{|s| s.to_i }
    end
  end
end

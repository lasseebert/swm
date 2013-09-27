require 'spec_helper'

describe Swm::ResizeCommand do
  it 'should preserve window position when resizing with empty arguments' do
    resize_command = Swm::ResizeCommand.new
    window = Swm::Window.current
    expect { resize_command.run }.to_not change {
      [
        window.pos_x,
        window.pos_y,
        window.width,
        window.height
      ]
    }
  end
end

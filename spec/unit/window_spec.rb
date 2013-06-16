require 'spec_helper'

describe Swm::Window do

  let(:window) { Swm::Window.current }

  describe 'height' do
    subject { window.height }
    it { should be_kind_of Integer }
  end

  describe 'width' do
    subject { window.width }
    it { should be_kind_of Integer }
  end

  describe 'pos_x' do
    subject { window.pos_x }
    it { should be_kind_of Integer }
  end

  describe 'pos_y' do
    subject { window.pos_y }
    it { should be_kind_of Integer }
  end
end

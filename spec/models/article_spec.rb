require 'spec_helper'

describe Article do
  describe 'factories' do
    it 'make valid records' do
      create(:article).should be_valid
      build(:article).should be_valid
    end
  end
end

require 'spec_helper'
require 'eat_your_vegetables'

describe EatYourVegetables do
  it 'should have a VERSION constant' do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

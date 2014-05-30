require 'spec_helper'

describe SimpleLogic do
  it "should parse logic statements" do
    context = { hungry: true, fridge_empty: true, restaurant_nearby: true}
    expression = "hungry && !fridge_empty || restaurant_nearby" 
    in_luck = SimpleLogic.eval(expression, context)
    in_luck.should == true
  end
end

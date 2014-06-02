require 'spec_helper'

describe SimpleLogic do
  it "should evaluate single variable" do
    context = { hungry: true }
    expression = "hungry" 
    in_luck = SimpleLogic.eval(expression, context)
    expect(in_luck).to eq true
  end

  it "should evaluate negated variable" do
    context = { hungry: true }
    expression = "!hungry" 
    in_luck = SimpleLogic.eval(expression, context)
    expect(in_luck).to eq false
  end

  it "should evaluate logical and" do
    context = { hungry: true, fridge_empty: false}
    expression = "hungry && fridge_empty" 
    in_luck = SimpleLogic.eval(expression, context)
    expect(in_luck).to eq false
  end

  it "should evaluate logical or" do
    context = { hungry: true, fridge_empty: false}
    expression = "hungry || fridge_empty" 
    in_luck = SimpleLogic.eval(expression, context)
    expect(in_luck).to eq true
  end

  it "should evaluate chained logic statements" do
    context = { hungry: true, fridge_empty: true, restaurant_nearby: true}
    expression = "hungry && !fridge_empty || restaurant_nearby" 
    in_luck = SimpleLogic.eval(expression, context)
    expect(in_luck).to eq true
  end

  it "should raise an exception on a syntax error" do
    expect { SimpleLogic.eval("> hungry", {}) }.to raise_error {|e|
      expect(e.offset).to eq 0
    }
  end

  it "should raise an exception on a syntax error and indicate location of parse error" do
    expect { 
      SimpleLogic.eval("testing > hungry", {testing: true}) 
    }.to raise_error(SimpleLogic::ParseError) {|e|
      expect(e.offset).to eq 7
    }
  end

  it "should raise an exception on undefined variable" do
    expect { 
      SimpleLogic.eval("testing && hungry", {testing: true}) 
    }.to raise_error(SimpleLogic::UndefinedVariableError) {|e|
      expect(e.offset).to eq 11
      expect(e.name).to eq "hungry"
    }

  end

end

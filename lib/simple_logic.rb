require "simple_logic/version"
require "simple_logic/parser"
require "simple_logic/precedence_table"
require "simple_logic/syntax_nodes"
require 'treetop'

module SimpleLogic

  def self.eval(data, context)
    Parser.parse(data).eval(context)
  end

end
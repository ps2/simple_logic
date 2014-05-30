require 'treetop'

module SimpleLogic
  class ParseError < StandardError
    attr_reader :offset
    def initialize(offset)
      @offset = offset
    end
  end

  class Parser
    base_path = File.expand_path(File.dirname(__FILE__))
    Treetop.load(File.join(base_path, 'simple_logic'))
    @@parser = SimpleLogicParser.new

    def self.parse(data)
      # Pass the data over to the parser instance
      tree = @@parser.parse(data)

      # If the AST is nil then there was an error during parsing
      # we need to report a simple error message to help the user
      if(tree.nil?)
       raise ParseError.new(@@parser.index), "Parse error at offset: #{@@parser.index}"
      end

      return tree
    end
  end
end
module SimpleLogic
  class ParseError < StandardError
    attr_reader :offset
    def initialize(offset)
      @offset = offset
    end
  end

  class UndefinedVariableError < StandardError
    attr_reader :offset
    def initialize(offset)
      @offset = offset
    end
  end

end

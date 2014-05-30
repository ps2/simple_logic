module SimpleLogic
  module PrecedenceTable
    class Operator
      attr_accessor :precedence, :associativity, :symbol
      def initialize(precedence, associativity, symbol)
        @precedence = precedence
        @associativity = associativity
        @symbol = symbol
      end

      def left_associative?
        @associativity == :left
      end

      def apply(l, r)
        if @symbol == "&&"
          l && r
        elsif @symbol == "||"
          l || r
        else
          raise "Invalid operator: #{@symbol}"
        end
      end

    end

    def self.lookup(operator)
      @operators[operator]
    end

    def self.op(associativity, *operators)
      @precedence ||= 0
      @operators ||= {}
      operators.each do |operator|
        @operators[operator] = Operator.new(@precedence, associativity, operator)
      end
      @precedence += 1
    end

    # operator precedence, low to high
    op :left, '||'
    op :left, '&&'
    op :none, '==', '!='
    op :left, '<', '<=', '>', '>='
    op :left, '+', '-'
    op :left, '*', '/'
    op :right, '^'
  end
end


module SimpleLogic
  class Expression < Treetop::Runtime::SyntaxNode    
  end

  class InfixOperation < Treetop::Runtime::SyntaxNode    
    def eval(context)
      rpn(shunting_yard(values_and_operators(context)))
    end

    def list
      lhs.list + [rhs]
    end

    def values_and_operators(context)
      list.map do |node|
        if node.instance_of?(Treetop::Runtime::SyntaxNode)
          PrecedenceTable.lookup(node.text_value)
        else
          node.eval(context)
        end
      end
    end

    def shunting_yard(input)
      [].tap do |rpn|
        operator_stack = []
        input.each do |object|
          if object.instance_of?(PrecedenceTable::Operator)
            op1 = object
            rpn << operator_stack.pop while (op2 = operator_stack.last) && (op1.left_associative? ? op1.precedence <= op2.precedence : op1.precedence < op2.precedence)
            operator_stack << op1
          else
            rpn << object
          end
        end
        rpn << operator_stack.pop until operator_stack.empty?
      end
    end

    def rpn(input)
      results = []
      input.each do |object|
        if object.instance_of?(PrecedenceTable::Operator)
          r, l = results.pop, results.pop
          results << object.apply(l, r)
        else
          results << object
        end
      end
      results.first
    end  
  end

  class InfixOperationChain < Treetop::Runtime::SyntaxNode    
    def list
      elements.map {|e| [e.primary, e.operator] }.flatten
    end
  end

  class Variable < Treetop::Runtime::SyntaxNode
    def eval(context)
      key = text_value.to_sym
      if context.include?(key)
        context[key]
      else
        raise UndefinedVariableError, "Undefined variable: \"#{text_value}\""
      end
    end
  end

  class NegationOperator < Treetop::Runtime::SyntaxNode
    def eval(context)
      ! elements[1].eval(context)
    end
  end
end


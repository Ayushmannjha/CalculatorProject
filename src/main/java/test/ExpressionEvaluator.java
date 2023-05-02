package test;
import java.util.Stack;

public class ExpressionEvaluator {

    /**
     * Evaluate the given expression according to BODMAS rule
     */
	 public static int evalExpression(String expression) {
        Stack<Integer> operands = new Stack<>();
        Stack<Character> operators = new Stack<>();
        
        int i = 0;
        while(i < expression.length()) {
            char c = expression.charAt(i);
            
            if(Character.isDigit(c)) {
                // Extract the operand from the expression
                int operand = 0;
                while(i < expression.length() && Character.isDigit(expression.charAt(i))) {
                    operand = operand * 10 + (expression.charAt(i) - '0');
                    i++;
                }
                
                // Push the operand to the operands stack
                operands.push(operand);
            }
            else if(isOperator(c)) {
                // Push the operator to the operators stack
                while(!operators.isEmpty() && hasPrecedence(c, operators.peek())) {
                    applyOperator(operands, operators.pop());
                }
                operators.push(c);
                i++;
            }
            else {
                i++;
            }
        }
        
        // Apply the remaining operators to the operands stack
        while(!operators.isEmpty()) {
            applyOperator(operands, operators.pop());
        }
        
        // Return the final result
        return operands.pop();
    }
    
    /**
     * Check if the given character is an operator (+, -, *, /)
     */
    public static boolean isOperator(char c) {
        return c == '+' || c == '-' || c == 'X' || c == '/';
    }
    
    /**
     * Check if the operator op1 has higher or equal precedence than the operator op2
     */
    public static boolean hasPrecedence(char op1, char op2) {

        if((op1 == 'X' || op1 == '/') && (op2 == '+' || op2 == '-')) {
            return false;
        }
        return true;
    }
    
    /**
     * Apply the operator to the top two operands on the stack
     */
    public static void applyOperator(Stack<Integer> operands, char operator) {
        int operand2 = operands.pop();
        int operand1 = operands.pop();
        
        switch(operator) {
            case '+':
                operands.push(operand1 + operand2);
                break;
            case '-':
                operands.push(operand1 - operand2);
                break;
            case 'X':
                operands.push(operand1 * operand2);
                break;
            case '/':
                operands.push(operand1 / operand2);
                break;
        }
    }
}

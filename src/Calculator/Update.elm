module Calculator.Update exposing (calculatorUpdate)

import Calculator.Model exposing (CalculatorModel)
import Calculator.Messages exposing (CalculatorMsg(..))
import Calculator.Utils exposing (evaluateExpression, clearCalcModel, setOperator, setOperand)

calculatorUpdate : CalculatorMsg -> CalculatorModel -> CalculatorModel
calculatorUpdate calcMsg calcModel =
    case calcMsg of
        Evaluate ->
            evaluateExpression calcModel

        Clear ->
            clearCalcModel calcModel

        Operation operator ->
            setOperator operator calcModel

        Operand value ->
            setOperand value calcModel


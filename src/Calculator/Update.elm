module Calculator.Update exposing (..)

import Calculator.Model exposing (CalculatorModel, Operator(..))
import Calculator.Messages exposing (CalculatorMsg(..))

clearCalcModel : CalculatorModel -> CalculatorModel
clearCalcModel calcModel =
    { calcModel | runningTotal = 0
    , operandA = ""
    , operandB = ""
    , operator = None
    }

setOperand : String -> CalculatorModel -> CalculatorModel
setOperand value calcModel =
    case calcModel.operator of
        None ->
            { calcModel | operandA = calcModel.operandA ++ value }
        _ ->
            { calcModel | operandB = calcModel.operandB ++ value }

setOperator : Operator -> CalculatorModel -> CalculatorModel
setOperator operator calcModel =
    { calcModel | operator = operator }

evaluateExpression : CalculatorModel -> CalculatorModel
evaluateExpression calcModel =
    let
        operandA =
            Result.withDefault 0 (String.toInt calcModel.operandA)

        operandB =
            Result.withDefault 0 (String.toInt calcModel.operandB)

        operator =
            calcModel.operator
    in
        case operator of
            Add ->
                { calcModel | runningTotal = operandA + operandB
                , operandA = ""
                , operandB = ""
                , operator = None
                }

            Subtract ->
                { calcModel | runningTotal = operandA - operandB
                , operandA = ""
                , operandB = ""
                , operator = None
                }

            Multiply ->
                { calcModel | runningTotal = operandA * operandB
                , operandA = ""
                , operandB = ""
                , operator = None
                }

            Divide ->
                { calcModel | runningTotal = operandA // operandB
                , operandA = ""
                , operandB = ""
                , operator = None
                }

            None ->
                calcModel

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


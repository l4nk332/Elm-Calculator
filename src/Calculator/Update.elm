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

firstTwoRegistersSet : CalculatorModel -> Bool
firstTwoRegistersSet calcModel =
    if calcModel.operandA /= "" && calcModel.operandB == "" then
        True
    else
        False

allRegistersSet : CalculatorModel -> Bool
allRegistersSet calcModel =
    if calcModel.operandA /= "" && calcModel.operandB /= "" && calcModel.operator /= None then
        True
    else
        False

carryRunningTotal : Operator -> CalculatorModel -> CalculatorModel
carryRunningTotal operator calcModel =
    { calcModel | operandA = toString calcModel.runningTotal, operator = operator }

setOperator : Operator -> CalculatorModel -> CalculatorModel
setOperator operator calcModel =
    if firstTwoRegistersSet calcModel then
        { calcModel | operator = operator }
    else if allRegistersSet calcModel then
        carryRunningTotal operator (evaluateExpression calcModel)
    else
        calcModel

evaluateExpression : CalculatorModel -> CalculatorModel
evaluateExpression calcModel =
    let
        operandA =
                Result.withDefault 0 (String.toFloat calcModel.operandA)

        operandB =
                Result.withDefault 0 (String.toFloat calcModel.operandB)

        operator =
            calcModel.operator
    in
        case operator of
            Add ->
                { calcModel | runningTotal = operandA + operandB
                , operandA = toString (operandA + operandB)
                , operandB = ""
                , operator = None
                }

            Subtract ->
                { calcModel | runningTotal = operandA - operandB
                , operandA = toString (operandA - operandB)
                , operandB = ""
                , operator = None
                }

            Multiply ->
                { calcModel | runningTotal = operandA * operandB
                , operandA = toString (operandA * operandB)
                , operandB = ""
                , operator = None
                }

            Divide ->
                { calcModel | runningTotal = operandA / operandB
                , operandA = toString (operandA / operandB)
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


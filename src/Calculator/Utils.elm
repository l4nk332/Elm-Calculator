module Calculator.Utils exposing (evaluateExpression, clearCalcModel, setOperator, setOperand, getSymbolFromOperator, handleKeyEvent)

import Calculator.Model exposing (CalculatorModel, Operator(..))
import Keyboard


clearCalcModel : CalculatorModel -> CalculatorModel
clearCalcModel calcModel =
    { calcModel
        | runningTotal = 0
        , operandA = ""
        , operandB = ""
        , operator = None
    }


setOperand : String -> CalculatorModel -> CalculatorModel
setOperand value calcModel =
    case calcModel.operator of
        None ->
            if value == "." && (String.contains value calcModel.operandA) then
                calcModel
            else if value == "-" then
                if String.startsWith value calcModel.operandA then
                    { calcModel | operandA = String.dropLeft 1 calcModel.operandA }
                else
                    { calcModel | operandA = value ++ calcModel.operandA }
            else
                { calcModel | operandA = calcModel.operandA ++ value }

        _ ->
            if value == "." && (String.contains value calcModel.operandB) then
                calcModel
            else if value == "-" then
                if String.startsWith value calcModel.operandB then
                    { calcModel | operandB = String.dropLeft 1 calcModel.operandB }
                else
                    { calcModel | operandB = value ++ calcModel.operandB }
            else
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
                { calcModel
                    | runningTotal = operandA + operandB
                    , operandA = toString (operandA + operandB)
                    , operandB = ""
                    , operator = None
                }

            Subtract ->
                { calcModel
                    | runningTotal = operandA - operandB
                    , operandA = toString (operandA - operandB)
                    , operandB = ""
                    , operator = None
                }

            Multiply ->
                { calcModel
                    | runningTotal = operandA * operandB
                    , operandA = toString (operandA * operandB)
                    , operandB = ""
                    , operator = None
                }

            Divide ->
                { calcModel
                    | runningTotal = operandA / operandB
                    , operandA = toString (operandA / operandB)
                    , operandB = ""
                    , operator = None
                }

            None ->
                calcModel


getSymbolFromOperator : Operator -> String
getSymbolFromOperator operator =
    case operator of
        Add ->
            "+"

        Subtract ->
            "-"

        Multiply ->
            "x"

        Divide ->
            "÷"

        None ->
            ""


handleKeyEvent : Keyboard.KeyCode -> CalculatorModel -> CalculatorModel
handleKeyEvent keyCode calcModel =
    case keyCode of
        8 ->
            clearCalcModel calcModel

        13 ->
            evaluateExpression calcModel

        187 ->
            evaluateExpression calcModel

        48 ->
            setOperand "0" calcModel

        49 ->
            setOperand "1" calcModel

        50 ->
            setOperand "2" calcModel

        51 ->
            setOperand "3" calcModel

        52 ->
            setOperand "4" calcModel

        53 ->
            setOperand "5" calcModel

        54 ->
            setOperand "6" calcModel

        55 ->
            setOperand "7" calcModel

        56 ->
            setOperand "8" calcModel

        57 ->
            setOperand "9" calcModel

        110 ->
            setOperand "." calcModel

        190 ->
            setOperand "." calcModel

        83 ->
            setOperand "-" calcModel

        106 ->
            setOperator Multiply calcModel

        88 ->
            setOperator Multiply calcModel

        107 ->
            setOperator Add calcModel

        80 ->
            setOperator Add calcModel

        109 ->
            setOperator Subtract calcModel

        189 ->
            setOperator Subtract calcModel

        111 ->
            setOperator Divide calcModel

        191 ->
            setOperator Divide calcModel

        _ ->
            calcModel

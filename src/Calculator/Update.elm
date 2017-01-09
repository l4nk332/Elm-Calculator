module Calculator.Update exposing (..)

import Calculator.Model exposing (CalculatorModel, Mode(..))
import Calculator.Messages exposing (CalculatorMsg(..))

clearCalcModel : CalculatorModel -> CalculatorModel
clearCalcModel calcModel =
    { calcModel | runningTotal = 0
    , mode = OperandMode
    , operatorList = []
    , operandList = []
    }

calculatorUpdate : CalculatorMsg -> CalculatorModel -> CalculatorModel
calculatorUpdate calcMsg calcModel =
    case calcMsg of
        Evaluate ->
            calcModel
        Clear ->
            clearCalcModel calcModel
        Operation operator ->
            calcModel
        Operand value ->
            calcModel


module Calculator.Model exposing (..)

type Operator = Add
                | Subtract
                | Multiply
                | Divide

type Mode = OperatorMode
            | OperandMode

type alias CalculatorModel =
    { runningTotal : Float
    , mode : Mode
    , operandList : List Float
    , operatorList : List Operator
    }

initialCalculatorModel : CalculatorModel
initialCalculatorModel =
    { runningTotal = 0
    , mode = OperandMode
    , operandList = []
    , operatorList = []
    }

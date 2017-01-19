module Calculator.Model exposing (..)

type Operator = Add
                | Subtract
                | Multiply
                | Divide
                | None

type alias CalculatorModel =
    { runningTotal : Int
    , operandA : String
    , operandB : String
    , operator : Operator
    }

initialCalculatorModel : CalculatorModel
initialCalculatorModel =
    { runningTotal = 0
    , operandA = ""
    , operandB = ""
    , operator = None
    }

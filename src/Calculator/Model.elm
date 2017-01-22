module Calculator.Model exposing (CalculatorModel, initialCalculatorModel, Operator(..))


type Operator
    = Add
    | Subtract
    | Multiply
    | Divide
    | None


type alias CalculatorModel =
    { runningTotal : Float
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

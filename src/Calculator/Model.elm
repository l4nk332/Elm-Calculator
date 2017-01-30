module Calculator.Model exposing (CalculatorModel, initialCalculatorModel, Operator(..))


type Operator
    = Add
    | Subtract
    | Multiply
    | Divide
    | Modulo
    | None


type alias CalculatorModel =
    { runningTotal : Float
    , operandA : String
    , operandB : String
    , operator : Operator
    , opError : String
    }


initialCalculatorModel : CalculatorModel
initialCalculatorModel =
    { runningTotal = 0
    , operandA = ""
    , operandB = ""
    , operator = None
    , opError = ""
    }

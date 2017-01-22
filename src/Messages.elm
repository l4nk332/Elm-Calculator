module Messages exposing (Msg(..))

import Calculator.Messages exposing (CalculatorMsg)


type Msg
    = CalculatorRoute CalculatorMsg

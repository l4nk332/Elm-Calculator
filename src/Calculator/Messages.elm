module Calculator.Messages exposing (CalculatorMsg(..))

import Keyboard
import Calculator.Model exposing (Operator)


type CalculatorMsg
    = Evaluate
    | Clear
    | Operation Operator
    | Operand String
    | Keydown Int

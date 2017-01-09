module Calculator.Messages exposing (..)

import Calculator.Model exposing (Operator)

type CalculatorMsg = Evaluate
                    | Clear
                    | Operation Operator
                    | Operand String

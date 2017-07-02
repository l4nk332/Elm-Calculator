module Calculator.Subscriptions exposing (calculatorSub)

import Keyboard
import Calculator.Model exposing (CalculatorModel)
import Calculator.Messages exposing (CalculatorMsg(..))


calculatorSub : CalculatorModel -> Sub CalculatorMsg
calculatorSub calcModel =
    Keyboard.downs Keydown

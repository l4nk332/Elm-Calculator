module Calculator.View exposing (..)

import Html exposing (Html, text)
import Calculator.Model exposing (CalculatorModel)
import Calculator.Messages exposing (CalculatorMsg(..))

calculatorView : CalculatorModel -> Html CalculatorMsg
calculatorView calcModel =
    text (toString calcModel)

module Calculator.View exposing (..)

import Html exposing (Html, div, button, h1, text)
import Html.Events exposing (onClick)
import Calculator.Model exposing (CalculatorModel, Operator(..))
import Calculator.Messages exposing (CalculatorMsg(..))

calculatorView : CalculatorModel -> Html CalculatorMsg
calculatorView calcModel =
    div []
        [ h1 [] [ text (toString (calcModel.runningTotal)) ]
        , button [ onClick (Operand "1") ] [ text "1" ]
        , button [ onClick (Operation Add) ] [ text "+" ]
        , button [ onClick Evaluate ] [ text "=" ]
        ]


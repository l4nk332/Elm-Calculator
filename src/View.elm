module View exposing (..)

import Html exposing (Html, div)
import Model exposing (Model)
import Messages exposing (Msg(..))
import Calculator.View exposing (calculatorView)

view : Model -> Html Msg
view model =
    div [] [ (Html.map CalculatorRoute (calculatorView model.calculatorModel)) ]

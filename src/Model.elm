module Model exposing (Model, initialModel)

import Messages exposing (Msg)
import Calculator.Model exposing (CalculatorModel, initialCalculatorModel)


type alias Model =
    { calculatorModel : CalculatorModel }


initialModel : ( Model, Cmd Msg )
initialModel =
    ( { calculatorModel = initialCalculatorModel }, Cmd.none )

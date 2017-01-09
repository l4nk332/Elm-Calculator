module Update exposing (..)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Calculator.Update exposing (calculatorUpdate)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CalculatorRoute calcMsg ->
            let
                ( updatedCalcModel, cmd ) =
                    ( (calculatorUpdate calcMsg model.calculatorModel), Cmd.none )
            in
                ( { model | calculatorModel = updatedCalcModel }, cmd )

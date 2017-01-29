module Subscriptions exposing (subscriptions)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Calculator.Messages exposing (CalculatorMsg(..))
import Calculator.Subscriptions exposing (calculatorSub)


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        calcSub =
            calculatorSub model.calculatorModel
    in
        Sub.batch [ Sub.map CalculatorRoute calcSub ]

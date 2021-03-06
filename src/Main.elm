module Main exposing (main)

import Html exposing (Html, program)
import Model exposing (Model, initialModel)
import Update exposing (update)
import Messages exposing (Msg)
import View exposing (view)
import Subscriptions exposing (subscriptions)

-- Main


main : Program Never Model Msg
main =
    program
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

module Main exposing (..)

import Html exposing (Html, program)
import Model exposing (Model, initialModel)
import Update exposing (update)
import Messages exposing (Msg)
import View exposing (view)


-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- Main

main : Program Never Model Msg
main =
    program
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

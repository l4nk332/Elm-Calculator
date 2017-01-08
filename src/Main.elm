module Main exposing (..)

import Html exposing (Html, program, text)

-- Model

type alias Model = String

init : ( Model, Cmd Msg )
init = ( "Calculator Application", Cmd.none )

-- Update

type Msg = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

-- View

view : Model -> Html Msg
view model =
    text model

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- Main

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

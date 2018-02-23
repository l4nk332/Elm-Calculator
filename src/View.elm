module View exposing (view)

import Html exposing (Html, div, hr, a, text)
import Html.Attributes exposing (class, href)
import Model exposing (Model)
import Messages exposing (Msg(..))
import Calculator.View exposing (calculatorView)


view : Model -> Html Msg
view model =
    div []
        [ div [ class "header" ]
            [ a [ href "https://github.com/l4nk332/Elm-Calculator", class "title" ]
                [ text "Elm-Calculator" ]
            , hr [ class "separator" ] []
            ]
        , div
            []
            [ (Html.map CalculatorRoute (calculatorView model.calculatorModel)) ]
        ]

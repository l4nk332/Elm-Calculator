module Calculator.View exposing (calculatorView)

import Html exposing (Html, div, button, h1, p, text)
import Html.Events exposing (onClick)
import Calculator.Model exposing (CalculatorModel, Operator(..))
import Calculator.Messages exposing (CalculatorMsg(..))
import Calculator.Utils exposing (getOperatorSymbol)


calculatorView : CalculatorModel -> Html CalculatorMsg
calculatorView calcModel =
    div []
        [
            h1 [] [ text (toString (calcModel.runningTotal)) ]
            , p [] [ text ("Operand A: " ++ calcModel.operandA) ]
            , p [] [ text ("Operator: " ++ getOperatorSymbol calcModel.operator) ]
            , p [] [ text ("Operand B: " ++ calcModel.operandB) ]
            , div [] [
                button [ onClick (Operand "0") ] [ text "0" ]
                , button [ onClick (Operand "1") ] [ text "1" ]
                , button [ onClick (Operand "2") ] [ text "2" ]
                , button [ onClick (Operand "3") ] [ text "3" ]
                , button [ onClick (Operand "4") ] [ text "4" ]
                , button [ onClick (Operand "5") ] [ text "5" ]
                , button [ onClick (Operand "6") ] [ text "6" ]
                , button [ onClick (Operand "7") ] [ text "7" ]
                , button [ onClick (Operand "8") ] [ text "8" ]
                , button [ onClick (Operand "9") ] [ text "9" ]
            ]
            , div [] [
                button [ onClick (Operation Add) ] [ text "+" ]
                , button [ onClick (Operation Subtract) ] [ text "-" ]
                , button [ onClick (Operation Multiply) ] [ text "x" ]
                , button [ onClick (Operation Divide) ] [ text "÷" ]
            ]
            , div [] [
                button [ onClick Evaluate ] [ text "=" ]
                , button [ onClick Clear ] [ text "C" ]
                , button [ onClick (Operand ".") ] [ text "." ]
                , button [ onClick (Operand "-") ] [ text "+/-" ]
            ]
        ]


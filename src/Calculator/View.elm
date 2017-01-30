module Calculator.View exposing (calculatorView)

import Html exposing (Html, div, h5, small, table, tbody, tr, td, text)
import Html.Attributes exposing (class, colspan)
import Html.Events exposing (onClick)
import Calculator.Model exposing (CalculatorModel, Operator(..))
import Calculator.Messages exposing (CalculatorMsg(..))
import Calculator.Utils exposing (getSymbolFromOperator)


displayOperandOrZero : String -> String
displayOperandOrZero operand =
    if operand == "" then
        "0"
    else
        operand


calculatorDisplay : CalculatorModel -> Html CalculatorMsg
calculatorDisplay calcModel =
    div [ class "display" ]
        [ h5 [ class "display__value" ] [ text (displayOperandOrZero (calcModel.operandA)) ]
        , small [ class "display__operations" ] [ text ((getSymbolFromOperator calcModel.operator) ++ calcModel.operandB) ]
        ]


calculatorNumPad : CalculatorModel -> Html CalculatorMsg
calculatorNumPad calcModel =
    table [ class "numpad" ]
        [ tbody []
            [
                tr [ class "numpad__row" ] [
                    td [ onClick Clear, class "numpad__cell size_one" ] [ text "AC" ]
                    , td [ onClick (Operand "-"), class "numpad__cell size_one" ] [ text "+/-" ]
                    , td [ class "numpad__cell size_one" ] [ text "%" ]
                    , td [ onClick (Operation Divide), class "numpad__cell size_one operator" ] [ text "÷" ]
                ],
                tr [ class "numpad__row" ] [
                    td [ onClick (Operand "7"), class "numpad__cell size_one operand" ] [ text "7" ]
                    , td [ onClick (Operand "8"), class "numpad__cell size_one operand" ] [ text "8" ]
                    , td [ onClick (Operand "9"), class "numpad__cell size_one operand" ] [ text "9" ]
                    , td [ onClick (Operation Multiply), class "numpad__cell size_one operator" ] [ text "x" ]
                ],
                tr [ class "numpad__row" ] [
                    td [ onClick (Operand "4"), class "numpad__cell size_one operand" ] [ text "4" ]
                    , td [ onClick (Operand "5"), class "numpad__cell size_one operand" ] [ text "5" ]
                    , td [ onClick (Operand "6"), class "numpad__cell size_one operand" ] [ text "6" ]
                    , td [ onClick (Operation Subtract), class "numpad__cell size_one operator" ] [ text "-" ]
                ],
                tr [ class "numpad__row" ] [
                    td [ onClick (Operand "1"), class "numpad__cell size_one operand" ] [ text "1" ]
                    , td [ onClick (Operand "2"), class "numpad__cell size_one operand" ] [ text "2" ]
                    , td [ onClick (Operand "3"), class "numpad__cell size_one operand" ] [ text "3" ]
                    , td [ onClick (Operation Add), class "numpad__cell size_one operator" ] [ text "+" ]
                ],
                tr [ class "numpad__row" ] [
                    td [ onClick (Operand "0"), colspan 2, class "numpad__cell size_two align-left operand" ] [ text "0" ]
                    , td [ onClick (Operand "."), class "numpad__cell size_one operand" ] [ text "." ]
                    , td [ onClick Evaluate, class "numpad__cell size_one operator" ] [ text "=" ]
                ]
            ]
        ]


calculatorView : CalculatorModel -> Html CalculatorMsg
calculatorView calcModel =
    div [ class "calculator" ]
        [ calculatorDisplay calcModel
        , calculatorNumPad calcModel
        ]

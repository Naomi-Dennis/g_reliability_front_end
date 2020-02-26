module Homepage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import HomepageHelper exposing (generateArrivalTimesTable)
import ArrivalTypes exposing (Msg, StationArrivalTimes)


index : StationArrivalTimes -> Html Msg
index model =
    div [ style "text-align" "center" ]
        [ div [ id "header" ]
            [ h1 [] [ text "Mind the G-App" ]
            ]
        , br [] []
        , div []
            [ table [ style "text-align" "left", style "width" "100%" ]
                (generateArrivalTimesTable model)
            ]
        ]
module IndexHelpers exposing (..)

import Html exposing (Html, td, text, tr)
import Models exposing (Msg)


generateArrivalTimesTable : List (List String) -> List (Html Msg)
generateArrivalTimesTable data =
    case data of
        [] ->
            [ tr [] [] ]

        head :: tail ->
            [ tr [] (List.map (\datum -> td [] [ text datum ]) head) ] ++ generateArrivalTimesTable tail

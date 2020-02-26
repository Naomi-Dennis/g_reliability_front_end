module HomepageHelper exposing (..)

import Html exposing (Html, td, text, tr)
import ArrivalTypes exposing (Msg)


generateArrivalTimesTable : List (List String) -> List (Html Msg)
generateArrivalTimesTable data =
    case data of
        [] ->
            [ tr [] [] ]

        head :: tail ->
            [ tr [] (List.map (\datum -> td [] [ text datum ]) head) ] ++ generateArrivalTimesTable tail

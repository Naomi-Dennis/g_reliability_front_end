module IndexHelpersTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Html exposing (Html, td, text, tr)
import IndexHelpers exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Index Helper Functions"
        [ test "#generateArrivalTimesTable return an empty table row if no data is given"
            (\_ ->
                let
                    arrivalTimeData =
                        []

                    expectedTableRows =
                        [ tr [] [] ]
                in
                Expect.equal expectedTableRows (generateArrivalTimesTable arrivalTimeData)
            )
        , test "#generateArrivalTimesTable returns data as HTML table rows if one row of data is given"
            (\_ ->
                let
                    arrivalTimeData =
                        [ [ "Predicted", "Actual", "Difference" ] ]

                    expectedTableRows =
                        [ tr [] [ td [] [ text "Predicted" ], td [] [ text "Actual" ], td [] [ text "Difference" ] ]
                        , tr [] []
                        ]
                in
                Expect.equal expectedTableRows (generateArrivalTimesTable arrivalTimeData)
            )
        , test "#generateArrivalTimesTable returns data as HTML table rows if multiple rows of data are given"
            (\_ ->
                let
                    arrivalTimeData =
                        [ [ "Predicted", "Actual", "Difference" ], [ "1:00", "2:00", "01:00:00" ] ]

                    expectedTableRows =
                        [ tr [] [ td [] [ text "Predicted" ], td [] [ text "Actual" ], td [] [ text "Difference" ] ]
                        , tr [] [ td [] [ text "1:00" ], td [] [ text "2:00" ], td [] [ text "01:00:00" ] ]
                        , tr [] []
                        ]
                in
                Expect.equal expectedTableRows (generateArrivalTimesTable arrivalTimeData)
            )
        ]

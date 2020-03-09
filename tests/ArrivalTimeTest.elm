module ArrivalTimeTest exposing (..)

import ArrivalTime exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Html exposing (Html, td, text, tr)
import Json.Decode as Decode exposing (decodeString)
import Test exposing (..)


suite : Test
suite =
    describe "Arrival Time"
        [ test "#validateArrivalData can parse raw JSON data into ArrivalTime object"
            (\_ ->
                let
                    arrivalData =
                        """{"day": ["Today", "1 Day Before", "2 Days Before"],"meanArrivalDifferences": [0.32,-0.34,0.01]}"""

                    decodedArrivalData =
                        decodeString arrivalTimeDecoder arrivalData

                    expectedElmObject =
                        validateArrivalData decodedArrivalData

                    arrivalTime =
                        ArrivalTimes [ "Today", "1 Day Before", "2 Days Before" ] [ 0.32, -0.34, 0.01 ]
                in
                Expect.equal expectedElmObject arrivalTime
            )
        ]

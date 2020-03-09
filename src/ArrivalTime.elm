module ArrivalTime exposing (..)

import Html exposing (Html, td, text, tr)
import Json.Decode as Decode exposing (Decoder, Error, errorToString, field, float, list, map2, string)


type alias ArrivalTimes =
    { day : List String, meanArrivalDifferences : List Float }


arrivalTimeDecoder : Decoder ArrivalTimes
arrivalTimeDecoder =
    map2 ArrivalTimes (field "day" (list string)) (field "meanArrivalDifferences" (list float))


validateArrivalData : Result Error ArrivalTimes -> ArrivalTimes
validateArrivalData rawData =
    case rawData of
        Err msg ->
            ArrivalTimes [ errorToString msg ] [ 0.0 ]

        Ok validArrivalData ->
            validArrivalData

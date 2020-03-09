port module Main exposing (elmToJS)

import ArrivalTime exposing (..)
import Browser
import Html exposing (Html)
import Json.Decode as Decode exposing (decodeString)
import Platform
import VegaLite exposing (..)


fakeArrivalData : String
fakeArrivalData =
    """{"day": ["7 Days Before", "6 Days Before", "5 Days Before", "4 Days BeforE", "3 Days Before", "2 Days Before", "1 Day Before", "Today"],"meanArrivalDifferences": [2.34, -0.10, 5.30, 7.20, -5.32, -4.20, 0.00, 0.32]}"""


decodedData =
    decodeString arrivalTimeDecoder fakeArrivalData


fakeArrivalTimes =
    validateArrivalData decodedData


xAxisName =
    "Day"


yAxisName =
    "Mean Difference in Estimated vs Actual Arrival Time (Minutes)"


arrivalBarGraph : Spec
arrivalBarGraph =
    let
        des =
            description "A simple bar chart with embedded data."

        data =
            dataFromColumns []
                << dataColumn xAxisName (strs fakeArrivalTimes.day)
                << dataColumn yAxisName (nums fakeArrivalTimes.meanArrivalDifferences)

        enc =
            encoding
                << position X [ pName xAxisName, pOrdinal, pSort [ soCustom (strs fakeArrivalTimes.day) ] ]
                << position Y [ pName yAxisName, pQuant ]
    in
    toVegaLite [ width 500, height 450, des, data [], enc [], bar [] ]


main : Program () Spec msg
main =
    Platform.worker
        { init = always ( arrivalBarGraph, elmToJS arrivalBarGraph )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = always Sub.none
        }


port elmToJS : Spec -> Cmd msg

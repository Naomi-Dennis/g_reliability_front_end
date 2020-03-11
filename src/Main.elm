port module Main exposing (elmToJS)

import ArrivalTime exposing (..)
import Browser
import Html exposing (Html)
import Json.Decode as Decode exposing (decodeString)
import Platform
import VegaLite exposing (..)


fakeArrivalData : String
fakeArrivalData =
    """{"day": [
            "7 Days Before",
            "6 Days Before",
            "5 Days Before",
            "4 Days Before",
            "3 Days Before",
            "2 Days Before",
            "Yesterday",
            "Today"
          ],
        "meanArrivalDifferences": [
                2.34,
                -0.10,
                5.30,
                7.20,
                -5.32,
                -4.20,
                0.00,
                0.32
          ]
        }"""


decodedData =
    decodeString arrivalTimeDecoder fakeArrivalData


fakeArrivalTimes =
    validateArrivalData decodedData


xAxisName =
    "Day"


yAxisName =
    "Mean Difference in Estimated vs Actual Arrival Time (Minutes)"


axisFontSize =
    18


axisLabelFontSize =
    15


titleContent =
    "Mind the G-App"


titleFontSize =
    32


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
                << position X [ pName xAxisName, pOrdinal, pSort [ soCustom (strs fakeArrivalTimes.day) ], pAxis [ axTitleFontSize axisFontSize ] ]
                << position Y [ pName yAxisName, pQuant, pAxis [ axTitleFontSize axisFontSize ] ]

        br =
            bar [ maColor "#6CBE45", maCornerRadius 4 ]

        graphTitle =
            title titleContent [ tiFontSize titleFontSize ]

        size =
            autosize [ asResize, asContent ]

        cfg =
            configure
                << configuration (coAxis [ axcoLabelFontSize axisLabelFontSize ])
    in
    toVegaLite [ graphTitle, width 500, height 450, cfg [], size, des, data [], enc [], br ]


main : Program () Spec msg
main =
    Platform.worker
        { init = always ( arrivalBarGraph, elmToJS arrivalBarGraph )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = always Sub.none
        }


port elmToJS : Spec -> Cmd msg

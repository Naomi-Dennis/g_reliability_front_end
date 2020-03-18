port module Main exposing (elmToJS)

import ArrivalTime exposing (..)
import Browser
import Html exposing (Html)
import Http exposing (..)
import Json.Decode as Decode exposing (decodeString)
import Platform
import VegaLite exposing (..)


type Response
    = ReceivedData (Result Http.Error ArrivalTimes)


xAxisName =
    "day"


yAxisName =
    "meanArrivalDifferences"


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
            description "A visualization of arrival time averages for the MTA G Train Greenpoint Ave. stop"

        data =
            dataFromUrl "http://localhost:4000/" []

        enc =
            encoding
                << position X [ pName xAxisName, pOrdinal, pSort [], pAxis [ axTitleFontSize axisFontSize ] ]
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
    toVegaLite [ graphTitle, width 500, height 450, cfg [], size, des, data, enc [], br ]


main : Program () Spec Response
main =
    Platform.worker
        { init = always ( arrivalBarGraph, elmToJS arrivalBarGraph )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = always Sub.none
        }


port elmToJS : Spec -> Cmd msg

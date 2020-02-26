module Main exposing (..)

import ArrivalTypes exposing (..)
import Browser
import Homepage exposing (index)
import Html exposing (Html)


fakeArrivalData : StationArrivalTimes
fakeArrivalData =
    [ [ "Predicted Arrival", "Actual Arrival", "Difference" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    , [ "1:00 AM", "2:00 AM", "01:00:00" ]
    ]


main =
    Browser.sandbox { init = init, update = update, view = view }


init : StationArrivalTimes
init =
    fakeArrivalData


update : Msg -> StationArrivalTimes -> StationArrivalTimes
update msg arrivalTimes =
    [ [ "" ] ]


view : StationArrivalTimes -> Html Msg
view model =
    index model

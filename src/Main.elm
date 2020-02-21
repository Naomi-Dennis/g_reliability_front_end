module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    String


init : Model
init =
    ""



-- UPDATE


type Msg
    = ParrottedMessage


update : Msg -> Model -> Model
update msg model =
    case msg of
        ParrottedMessage ->
            model ++ "bird noises "



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "main", style "width" "37%", style "margin" "0 auto", style "text-align" "center" ]
        [ div [ id "header" ]
            [ h1 [] [ text "English to Bird Translator" ]
            , h2 [] [ text "Talk to Birds!" ]
            ]
        , br []
            []
        , div
            [ id "message" ]
            [ p [] [ text "Enter something to translate!" ]
            , br [] []
            , input [] []
            , button [ style "margin-left" "10px", onClick ParrottedMessage ] [ text "Enter" ]
            , p [] [ text model ]
            ]
        ]

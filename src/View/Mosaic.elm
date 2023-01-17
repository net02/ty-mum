module View.Mosaic exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Html.Events.Extra.Mouse as Mouse
import Json.Decode as Decode
import Model exposing (Model)
import Mosaic exposing (..)
import Msg exposing (Msg)


view : Model -> List (Html Msg)
view model =
    let
        onLoad : Msg -> Attribute Msg
        onLoad message =
            on "load" (Decode.succeed message)
    in
    [ img
        [ src "./mosaic/base.png"
        , onLoad Msg.UpdateMosaicSize
        , id "mosaic"
        , Mouse.onMove (.offsetPos >> maybeUpdateTile model)
        , Mouse.onOut (\_ -> Msg.HideTile)
        , Mouse.onOver (.offsetPos >> maybeUpdateTile model)
        ]
        []
    ]


maybeUpdateTile : Model -> Model.Coordinates -> Msg
maybeUpdateTile model coords =
    if Mosaic.sameTile coords model then
        Msg.NoOp

    else
        case Mosaic.cellFromCoords coords model of
            Just tile ->
                Msg.ShowTile tile

            Nothing ->
                Msg.HideTile

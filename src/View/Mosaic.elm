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
    [ img
        [ src "./mosaic/base.png"
        , onLoad Msg.UpdateMosaicSize
        , id "mosaic"
        , Mouse.onMove (.offsetPos >> maybeUpdateTile model)
        , Mouse.onOver (.offsetPos >> maybeUpdateTile model)
        ]
        []
    , highligthedTile model
    ]


highligthedTile : Model -> Html Msg
highligthedTile { current, display, matrix, element } =
    let
        displayValue =
            if display then
                "block"

            else
                "none"

        visibilityStyle =
            case ( current, element ) of
                ( Just cell, Just domElement ) ->
                    [ style "display" displayValue
                    , domElement |> Mosaic.tileSize matrix |> ceiling |> intToPx |> style "width"
                    , domElement |> Mosaic.tilePosition cell matrix |> Tuple.first |> floatToPx |> style "left"
                    , domElement |> Mosaic.tilePosition cell matrix |> Tuple.second |> floatToPx |> style "top"
                    ]

                _ ->
                    [ style "display" "none" ]

        tile =
            case current of
                Just cell ->
                    [ img
                        [ src (matrix |> tileSrc cell |> String.append "./mosaic/tiles/")
                        , onLoad Msg.ShowTile
                        , Mouse.onOut (\_ -> Msg.HideTile)
                        ]
                        []
                    ]

                Nothing ->
                    []
    in
    div ([ id "tile" ] ++ visibilityStyle) tile


maybeUpdateTile : Model -> Model.Coordinates -> Msg
maybeUpdateTile model coords =
    if Mosaic.isSameTile coords model then
        Msg.NoOp

    else
        case Mosaic.cellFromCoords coords model of
            Just tile ->
                Msg.LoadTile tile

            Nothing ->
                Msg.HideTile


onLoad : Msg -> Attribute Msg
onLoad message =
    on "load" (Decode.succeed message)


floatToPx : Float -> String
floatToPx value =
    String.fromFloat value ++ "px"


intToPx : Int -> String
intToPx value =
    String.fromInt value ++ "px"

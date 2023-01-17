module View.Mosaic exposing (tileImage, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, onClick)
import Html.Events.Extra.Mouse as Mouse
import Json.Decode as Decode
import Model exposing (Model)
import Mosaic
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
highligthedTile model =
    let
        displayValue =
            if model.display then
                "block"

            else
                "none"

        visibilityStyle =
            case ( model.current, model.element ) of
                ( Just cell, Just domElement ) ->
                    [ style "display" displayValue
                    , domElement |> Mosaic.tileSize model.matrix |> ceiling |> intToPx |> style "width"
                    , domElement |> Mosaic.tilePosition cell model.matrix |> Tuple.first |> floatToPx |> style "left"
                    , domElement |> Mosaic.tilePosition cell model.matrix |> Tuple.second |> floatToPx |> style "top"
                    ]

                _ ->
                    [ style "display" "none" ]

        tile =
            tileImage model
                [ onLoad Msg.ShowTile
                , onClick Msg.OpenModal
                , Mouse.onOut (\_ -> Msg.HideTile)
                ]
    in
    div ([ id "tile" ] ++ visibilityStyle) [ tile ]


tileImage : Model -> List (Attribute Msg) -> Html Msg
tileImage { current, matrix } attributes =
    let
        imageSrc cell =
            src (matrix |> Mosaic.tileSrc cell |> String.append "./mosaic/tiles/")
    in
    case current of
        Just cell ->
            img ([ imageSrc cell ] ++ attributes) []

        Nothing ->
            text ""


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

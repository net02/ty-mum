module Mosaic exposing
    ( cellFromCoords
    , isSameTile
    , tilePosition
    , tileSize
    , tileSrc
    )

import Array exposing (Array)
import Model exposing (..)


cellFromCoords : Coordinates -> Model -> Maybe Cell
cellFromCoords coords model =
    let
        row =
            model.matrix |> rowsCount |> toFloat

        column =
            model.matrix |> columnsCount |> toFloat

        selectRow : DomElement -> Int
        selectRow element =
            floor (Tuple.second coords * row / element.height)

        selectColumn : DomElement -> Int
        selectColumn element =
            floor (Tuple.first coords * column / element.width)
    in
    case model.element of
        Just element ->
            Just ( selectRow element, selectColumn element )

        Nothing ->
            Nothing


isSameTile : Coordinates -> Model -> Bool
isSameTile coords model =
    model.current == cellFromCoords coords model


tileSize : Matrix -> DomElement -> Float
tileSize matrix element =
    element.height / (matrix |> rowsCount |> toFloat)


tilePosition : Cell -> Matrix -> DomElement -> ( Float, Float )
tilePosition cell matrix element =
    let
        size =
            tileSize matrix element

        x =
            (cell |> Tuple.second |> toFloat) * size + element.x

        y =
            (cell |> Tuple.first |> toFloat) * size + element.y
    in
    ( x, y )


tileSrc : Cell -> Matrix -> String
tileSrc cell matrix =
    matrix
        |> Array.get (Tuple.first cell)
        |> Maybe.withDefault Array.empty
        |> Array.get (Tuple.second cell)
        |> Maybe.withDefault ""


rowsCount : Matrix -> Int
rowsCount matrix =
    Array.length matrix


columnsCount : Matrix -> Int
columnsCount matrix =
    matrix
        |> Array.get 0
        |> Maybe.withDefault Array.empty
        |> Array.length

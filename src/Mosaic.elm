module Mosaic exposing
    ( cellFromCoords
    , sameTile
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


sameTile : Coordinates -> Model -> Bool
sameTile coords model =
    model.current == cellFromCoords coords model


rowsCount : Matrix -> Int
rowsCount matrix =
    Array.length matrix


columnsCount : Matrix -> Int
columnsCount matrix =
    matrix
        |> Array.get 0
        |> Maybe.withDefault Array.empty
        |> Array.length

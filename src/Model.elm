module Model exposing (..)

import Array exposing (Array)


type alias Model =
    { current : Maybe Cell
    , matrix : Matrix
    , element : Maybe DomElement
    }


type alias Matrix =
    Array Row


type alias Row =
    Array Tile


type alias Tile =
    String


type alias Cell =
    ( Int, Int )


type alias Coordinates =
    ( Float, Float )


type alias DomElement =
    { x : Float
    , y : Float
    , width : Float
    , height : Float
    }


initialModel : Model
initialModel =
    { current = Nothing
    , matrix =
        Array.fromList
            [ Array.fromList [ "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png" ]
            , Array.fromList [ "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png" ]
            , Array.fromList [ "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png" ]
            , Array.fromList [ "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png" ]
            , Array.fromList [ "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png" ]
            , Array.fromList [ "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png" ]
            , Array.fromList [ "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png", "red.png", "yellow.png", "blue.png" ]
            , Array.fromList [ "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png", "orange.png", "green.png", "purple.png" ]
            ]
    , element = Nothing
    }


setTile : Cell -> Model -> Model
setTile cell model =
    { model | current = Just cell }


removeTile : Model -> Model
removeTile model =
    { model | current = Nothing }


setElement : DomElement -> Model -> Model
setElement element model =
    { model | element = Just element }

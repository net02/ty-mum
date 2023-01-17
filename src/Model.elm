module Model exposing (..)

import Array exposing (Array)
import Bootstrap.Modal as Modal


type alias Model =
    { current : Maybe Cell
    , display : Bool
    , matrix : Matrix
    , element : Maybe DomElement
    , modalVisibility : Modal.Visibility
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
    let
        -- create a matrix such as
        -- [ ["0_0.jpg", "0_1.jpg", "0_2.jpg"]
        -- , ["1_0.jpg", "1_1.jpg", "1_2.jpg"]
        -- ]
        indexToFilename : Int -> Array Tile -> Array Tile
        indexToFilename index innerArray =
            Array.map (\s -> String.fromInt index ++ "_" ++ s) innerArray

        matrix =
            Array.initialize 12 (\n -> String.fromInt n ++ ".jpg")
                |> Array.repeat 8
                |> Array.indexedMap indexToFilename
    in
    { current = Nothing
    , display = False
    , matrix = matrix
    , element = Nothing
    , modalVisibility = Modal.hidden
    }


setTile : Cell -> Model -> Model
setTile cell model =
    { model | current = Just cell }


showTile : Model -> Model
showTile model =
    { model | display = True }


maybeRemoveTile : Model -> Model
maybeRemoveTile model =
    if model.modalVisibility == Modal.shown then
        model

    else
        { model | current = Nothing, display = False }


setElement : DomElement -> Model -> Model
setElement element model =
    { model | element = Just element }


openModal : Model -> Model
openModal model =
    { model | modalVisibility = Modal.shown }


closeModal : Model -> Model
closeModal model =
    { model | modalVisibility = Modal.hidden }

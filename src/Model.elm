module Model exposing (..)


type alias Model =
    { current : Maybe Tile
    , matrix : List Row
    }


type alias Tile =
    String


type alias Row =
    List Tile


initialModel : Model
initialModel =
    { current = Nothing
    , matrix =
        [ [ "red.png", "yellow.png", "blue.png" ]
        , [ "orange.png", "green.png", "purple.png" ]
        ]
    }


setTile : Tile -> Model -> Model
setTile tile model =
    { model | current = Just tile }


removeTile : Model -> Model
removeTile model =
    { model | current = Nothing }

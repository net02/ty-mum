module Msg exposing (..)

import Model exposing (Tile)


type Msg
    = ShowTile Tile
    | HideTile
    | UpdateTile Tile

module Msg exposing (..)

import Browser.Dom as Dom
import Model exposing (Cell)


type Msg
    = NoOp
    | UpdateMosaicSize
    | GotDomElement (Result Dom.Error Dom.Element)
    | ShowTile Cell
    | HideTile

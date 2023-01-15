module Model exposing (..)

import Msg exposing (Msg)


type alias Model =
    Image


type Image
    = Base
    | Clean


init : flags -> ( Model, Cmd Msg )
init _ =
    ( Base, Cmd.none )

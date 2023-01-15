module Main exposing (..)

import Browser
import Model exposing (Model)
import Msg exposing (Msg)
import Update
import View


main : Program () Model Msg
main =
    Browser.document
        { init = Model.init
        , update = Update.update
        , view = View.document
        , subscriptions = \_ -> Sub.none
        }

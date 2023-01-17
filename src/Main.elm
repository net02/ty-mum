module Main exposing (..)

import Browser
import Browser.Events as Events
import Model exposing (Model)
import Msg exposing (Msg)
import Update
import View


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( Model.initialModel, Cmd.none )
        , update = Update.update
        , view = View.document
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Events.onResize (\_ _ -> Msg.UpdateMosaicSize)

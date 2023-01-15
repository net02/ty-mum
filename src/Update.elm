module Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( Msg.SwitchImage, Model.Base ) ->
            ( Model.Clean, Cmd.none )

        ( Msg.SwitchImage, Model.Clean ) ->
            ( Model.Base, Cmd.none )

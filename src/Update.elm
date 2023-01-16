module Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.ShowTile tile ->
            ( Model.setTile tile model, Cmd.none )

        Msg.HideTile ->
            ( Model.removeTile model, Cmd.none )

        Msg.UpdateTile tile ->
            ( Model.removeTile model |> Model.setTile tile, Cmd.none )

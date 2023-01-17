module Update exposing (update)

import Browser.Dom as Dom
import Model exposing (Model)
import Msg exposing (Msg)
import Task


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    -- let
    --     _ =
    --         Debug.log "have" model
    --
    --     _ =
    --         Debug.log "got" msg
    -- in
    case msg of
        Msg.UpdateMosaicSize ->
            ( model, Dom.getElement "mosaic" |> Task.attempt Msg.GotDomElement )

        Msg.GotDomElement (Ok element) ->
            ( Model.setElement element.element model, Cmd.none )

        Msg.LoadTile tile ->
            ( Model.setTile tile model, Cmd.none )

        Msg.ShowTile ->
            ( Model.showTile model, Cmd.none )

        Msg.HideTile ->
            ( Model.removeTile model, Cmd.none )

        _ ->
            ( model, Cmd.none )

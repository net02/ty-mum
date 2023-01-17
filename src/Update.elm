module Update exposing (update)

import Browser.Dom as Dom
import Model exposing (Model)
import Msg exposing (Msg)
import Task


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
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
            ( Model.maybeRemoveTile model, Cmd.none )

        Msg.CloseModal ->
            ( Model.closeModal model, Cmd.none )

        Msg.OpenModal ->
            ( Model.openModal model, Cmd.none )

        _ ->
            ( model, Cmd.none )

module Main exposing (..)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)


-- MAIN


main : Program () Model Msg
main =
    Browser.document { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Model =
    Image


type Image
    = Base
    | Clean


init : flags -> ( Model, Cmd Msg )
init _ =
    ( Base, Cmd.none )



-- UPDATE


type Msg
    = SwitchImage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( SwitchImage, Base ) ->
            ( Clean, Cmd.none )

        ( SwitchImage, Clean ) ->
            ( Base, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Document Msg
view model =
    { title = "Tutte le cose più belle che abbiamo, le abbiamo fatte insieme a te"
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ div [class "main"]
        [ img
            [ src (imageToSrc model)
            , onClick SwitchImage
            , onMouseEnter SwitchImage
            , onMouseLeave SwitchImage
            , id "mosaic"
            ]
            []
        ]
    , div [class "footer"]
        [ p []
            [ text "Affamato? "
            , a [ href "https://docs.google.com/document/d/1vdujqysOnhKWjopHmlcQNZJG6tEGFvSIYq-QnseXHXU/edit?usp=sharing" ] [ text "torna alle ricette" ]
            , text " 🍝"
            ]
        , div [id "author"]
            [ text "Made with love by"
            , a [ target "_blank", href "https://github.com/net02" ]
                [ img [ src "https://www.gravatar.com/avatar/c897a5b2d4da792aa1240069b40969dd", align "middle", alt "net02", title "net02" ] [] ]
            , text " – see source"
            , a [ target "_blank", href "https://github.com/net02/ty-mum" ]
                [ img [ src "https://github.githubassets.com/images/modules/site/icons/footer/github-mark.svg", align "middle", alt "on github", title "on github" ] [] ]
            ]
        ]

    ]


imageToSrc : Image -> String
imageToSrc image =
    case image of
        Base ->
            "./mosaic/base.png"

        Clean ->
            "./mosaic/clear.png"

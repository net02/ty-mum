module View exposing (document)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Model exposing (Model)
import Msg


document : Model -> Document Msg.Msg
document model =
    { title = "Giovanna"
    , body = body model
    }


body : Model -> List (Html Msg.Msg)
body model =
    [ div [ class "main" ]
        [ img
            [ src (imageToSrc model)
            , onClick Msg.SwitchImage
            , onMouseEnter Msg.SwitchImage
            , onMouseLeave Msg.SwitchImage
            , id "mosaic"
            ]
            []
        ]
    , div [ class "footer" ]
        [ p []
            [ text "Affamato? "
            , a [ href "https://docs.google.com/document/d/1vdujqysOnhKWjopHmlcQNZJG6tEGFvSIYq-QnseXHXU/edit?usp=sharing" ] [ text "torna alle ricette" ]
            , text " 🍝"
            ]
        , div [ id "author" ]
            [ text "Made with love by"
            , a [ target "_blank", href "https://github.com/net02" ]
                [ img [ src "https://www.gravatar.com/avatar/c897a5b2d4da792aa1240069b40969dd", align "middle", alt "net02", title "net02" ] [] ]
            , text " – see source"
            , a [ target "_blank", href "https://github.com/net02/ty-mum" ]
                [ img [ src "https://github.githubassets.com/images/modules/site/icons/footer/github-mark.svg", align "middle", alt "on github", title "on github" ] [] ]
            ]
        ]
    ]


imageToSrc : Model.Image -> String
imageToSrc image =
    case image of
        Model.Base ->
            "./mosaic/base.png"

        Model.Clean ->
            "./mosaic/clear.png"
